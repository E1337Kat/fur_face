# frozen_string_literal: true

require 'test_helper'

class CatOwnersControllerTest < ActionDispatch::IntegrationTest
  setup do
    @cat = cats(:two)
    @owner = owners(:one)
  end

  test 'should get new' do
    get new_cat_owner_url
    assert_response :success
  end

  test 'should create cat_owner' do
    assert_difference('CatOwner.count') do
      valid_params = {
        cat_owner: {
          cat_id: @cat.id,
          owner_id: @owner.id
        }
      }
      post cat_owners_url, params: valid_params
    end

    assert_redirected_to root_path
  end
end
