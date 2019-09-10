# frozen_string_literal: true

# Can create a fancy new cat owner
module CatOwnersConcern
  def init_created(cat_owner = @cats_owner)
    CatOwner.bee!(cat_owner.owner, cat_owner.cat) if cat_owner.valid?

    cat_owner
  end
end
