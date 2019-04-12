# frozen_string_literal: true

module CatOwnersConcern
  def init_created(cat_owner = @cats_owner)
    if cat_owner.valid?
      CatOwner.bee!(cat_owner.owner, cat_owner.cat)
    end

    cat_owner
  end
end
