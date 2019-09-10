# frozen_string_literal: true

# Controller for creating new cat owners
class CatOwnersController < ApplicationController
  include CatOwnersConcern

  # Params allowed when creating a Cat Owner
  class CatOwnerParams
    def self.build(params)
      params.require(:cat_owner).permit(
        :owner_id,
        :cat_status,
        :owner_status,
        :cat_id
      )
    end
  end

  def create
    create_new_cat(params)

    CatOwner.can_pet_cat?(@cats_owner.owner, @cats_owner.cat)

    respond_to do |format|
      if @cats_owner.errors.blank?
        format.html do
          Rails.logger.info 'cat_owner.action.join_successful'
          send_back
        end
        format.json do
          render json: { message: 'cat_owner.action.join_successful', status: :created }
        end
      else
        format.html do
          Rails.logger.info @cats_owner.errors.full_messages
          send_back
        end
        format.json do
          render json: { errors: @cats_owner.errors.full_messages }, status: :unprocessable_entity
        end
      end
    end
  end

  def new
    @cats_owner = CatOwner.new
    @cats_owner.cat_status = :eating
    @cats_owner.owner_status = :playing

    @cat_select_list = Cat.all.map { |cat| [cat.name, cat.id] }
    @owner_select_list = Owner.all.map { |owner| [owner.name, owner.id] }

    respond_to do |format|
      format.html do
        render layout: false if request.xhr?
      end
    end
  end

  private

  def create_new_cat(params)
    @cats_owner = CatOwner.new(CatOwnerParams.build(params))
    @cats_owner = init_created
    @cats_owner.save
  end
end
