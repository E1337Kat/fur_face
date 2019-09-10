# frozen_string_literal: true

require 'test_helper'

class CatsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @cat = cats(:one)
    @cat_owner = cat_owners(:one)
  end

  test 'should get index' do
    get cats_url
    assert_response :success
  end

  test 'should get new' do
    get new_cat_url
    assert_response :success
  end

  test 'should create cat' do
    assert_difference('Cat.count') do
      valid_params = {
        cat: {
          claws: @cat.claws,
          fluff_ears: @cat.fluff_ears,
          fluff_type: @cat.fluff_type,
          meow: @cat.meow,
          name: @cat.name,
          personality: @cat.personality
        }
      }
      post cats_url, params: valid_params
    end

    assert_redirected_to cat_url(Cat.last)
  end

  test 'should show cat' do
    get cat_url(@cat)
    assert_response :success
  end

  test 'should get edit' do
    get edit_cat_url(@cat)
    assert_response :success
  end

  test 'should update cat' do
    valid_params = {
      cat: {
        claws: @cat.claws,
        fluff_ears: @cat.fluff_ears,
        fluff_type: @cat.fluff_type,
        meow: @cat.meow,
        name: @cat.name,
        personality: @cat.personality
      }
    }
    patch cat_url(@cat), params: valid_params
    assert_redirected_to cat_url(@cat)
  end

  test 'should destroy cat' do
    assert_difference('Cat.count', -1) do
      delete cat_url(@cat)
    end

    assert_redirected_to cats_url
  end
end
