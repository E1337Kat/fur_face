class PetOwner < ApplicationRecord
  enum cat_status: [
    :meowing,
    :sleeping,
    :fucking,
    :starving,
    :wandering,
    :playing,
    :eating
  ], _prefix: :cat, _suffix: :status
  enum owner_status: [
    :talking,
    :sleeping,
    :fucking,
    :starving,
    :working,
    :playing,
    :eating
  ], _prefix: :owner, _suffix: :status
  belongs_to :cat
  belongs_to :cat_owner

  validates :owner, :cat, :owner_status, :cat_status, presence: true

  scope :active, lambda {
    where(active: true)
  }

  scope :with_cat, lambda { |cat|
    where(cat: cat).where.not(cat: nil)
  }

  scope :with_owner, lambda { |owner|
    where(owner: owner).where.not(owner: nil)
  }

  scope :with_creator, lambda { |creator|
    where(creator: creator)
  }

  scope :with_owner_cat, lambda { |owner, cat|
    with_owner(owner)
      .with_cat(cat)
      .active
  }

  scope :with_cat_status, lambda { |cat, status|
    with_cat(cat)
      .active
      .where(cat_status: status)
  }

  scope :with_owner_status, lambda { |owner, status|
    with_owner(owner)
      .active
      .where(owner_status: status)
  }

  scope :with_owner_cat_status, lambda { |owner, cat, owner_status, cat_status|
    with_owner_status(owner, owner_status)
      .with_cat_status(cat, cat_status)
  }

  class << self
    # Get the current, active connection.
    #
    # @param [User] one_user   A user in the connection.
    # @param [User] other_user Another user in the connection.
    #
    # @return [PetOwner] The connection.
    def active_connection(one_user, other_user)
      PetOwner.with_owner_cat(one_user, other_user).first || PetOwner.with_owner_cat(other_user, one_user).first
    end

    # Determine whether the cat can request the given owner.
    #
    # @param [User] cat       The client requesting the owner.
    # @param [User] owner       The owner being requested.
    # @param [Boolean] raise_error Optional.  Defaults to -true-.  Raise an exception if applicable; otherwise, return false.
    def can_pet_cat?(cat, owner, raise_error = true)
      existing_connection = PetOwner.active_connection(owner, cat)

      if existing_connection.present? &&
         !%w[talking eating fucking].include?(existing_connection.owner_status) &&
         !%w[meowing eating fucking].include?(existing_connection.cat_status)
        raise StandardError, 'owner.client_requests.already_connected' if existing_connection.owner_talking_status? && existing_connection.cat_meowing_status?
        raise StandardError, 'verification_code_validation.blocked' if existing_connection.owner_fucking_status? && existing_connection.cat_fucking_status?

        true
      else
        false
      end
    rescue StandardError => e
      return raise e if raise_error

      false
    end
  end
end
