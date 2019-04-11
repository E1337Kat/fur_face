# frozen_string_literal: true

module CatOwnersConcern
  def init_created(cat_owner = @cats_owner)
    if cat_owner.valid?
      CatOwner.bee!(cat_owner.provider, cat_owner.consumer, current_user)
      cat_owner.created_by = current_user&.id
      cat_owner.updated_by = current_user&.id
    end

    cat_owner
  end
end
