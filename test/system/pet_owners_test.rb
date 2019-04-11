require "application_system_test_case"

class PetOwnersTest < ApplicationSystemTestCase
  setup do
    @pet_owner = pet_owners(:one)
  end

  test "visiting the index" do
    visit pet_owners_url
    assert_selector "h1", text: "Pet Owners"
  end

  test "creating a Pet owner" do
    visit pet_owners_url
    click_on "New Pet Owner"

    check "Actually a catgirl" if @pet_owner.actually_a_catgirl
    fill_in "Name", with: @pet_owner.name
    fill_in "Pets", with: @pet_owner.pets
    click_on "Create Pet owner"

    assert_text "Pet owner was successfully created"
    click_on "Back"
  end

  test "updating a Pet owner" do
    visit pet_owners_url
    click_on "Edit", match: :first

    check "Actually a catgirl" if @pet_owner.actually_a_catgirl
    fill_in "Name", with: @pet_owner.name
    fill_in "Pets", with: @pet_owner.pets
    click_on "Update Pet owner"

    assert_text "Pet owner was successfully updated"
    click_on "Back"
  end

  test "destroying a Pet owner" do
    visit pet_owners_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Pet owner was successfully destroyed"
  end
end
