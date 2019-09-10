# frozen_string_literal: true

require 'application_system_test_case'

class CatOwnersTest < ApplicationSystemTestCase
  setup do
    @cat_owner = cat_owners(:one)
  end

  test 'visiting the index' do
    visit cat_owners_url
    assert_selector 'h1', text: 'Cat Owners'
  end

  test 'creating a Cat owner' do
    visit cat_owners_url
    click_on 'New Cat Owner'

    check 'Actually a catgirl' if @cat_owner.actually_a_catgirl
    fill_in 'Name', with: @cat_owner.name
    fill_in 'Cats', with: @cat_owner.cats
    click_on 'Create Cat owner'

    assert_text 'Cat owner was successfully created'
    click_on 'Back'
  end

  test 'updating a Cat owner' do
    visit cat_owners_url
    click_on 'Edit', match: :first

    check 'Actually a catgirl' if @cat_owner.actually_a_catgirl
    fill_in 'Name', with: @cat_owner.name
    fill_in 'Cats', with: @cat_owner.cats
    click_on 'Update Cat owner'

    assert_text 'Cat owner was successfully updated'
    click_on 'Back'
  end

  test 'destroying a Cat owner' do
    visit cat_owners_url
    page.accept_confirm do
      click_on 'Destroy', match: :first
    end

    assert_text 'Cat owner was successfully destroyed'
  end
end
