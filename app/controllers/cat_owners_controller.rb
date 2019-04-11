# frozen_string_literal: true

class CatOwnersController < ApplicationController
  include CatOwnersConcern

  class PetOwnerParams
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
    @cats_owner = CatOwner.new(PetOwnerParams.build(params))
    @cats_owner = init_created
    @cats_owner.save

    respond_to do |format|
      if @cats_owner.errors.blank?
        format.html do
          flash[:success] = 'cat_owner.action.join_successful'
          send_back
        end
        format.json do
          render json: { message: 'cat_owner.action.join_successful', status: :created }
        end
      else
        format.html do
          flash[:error] = @cats_owner.errors.full_messages
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
    @cats_owner.cat_meowing_status!
    @cats_owner.owner_talking_status!

    respond_to do |format|
      format.html do
        render layout: false if request.xhr?
      end
    end
  end
end
