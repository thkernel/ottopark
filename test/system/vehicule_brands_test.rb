require "application_system_test_case"

class VehiculeBrandsTest < ApplicationSystemTestCase
  setup do
    @vehicule_brand = vehicule_brands(:one)
  end

  test "visiting the index" do
    visit vehicule_brands_url
    assert_selector "h1", text: "Vehicule Brands"
  end

  test "creating a Vehicule brand" do
    visit vehicule_brands_url
    click_on "New Vehicule Brand"

    fill_in "Description", with: @vehicule_brand.description
    fill_in "Name", with: @vehicule_brand.name
    fill_in "Status", with: @vehicule_brand.status
    fill_in "Uid", with: @vehicule_brand.uid
    fill_in "User", with: @vehicule_brand.user_id
    click_on "Create Vehicule brand"

    assert_text "Vehicule brand was successfully created"
    click_on "Back"
  end

  test "updating a Vehicule brand" do
    visit vehicule_brands_url
    click_on "Edit", match: :first

    fill_in "Description", with: @vehicule_brand.description
    fill_in "Name", with: @vehicule_brand.name
    fill_in "Status", with: @vehicule_brand.status
    fill_in "Uid", with: @vehicule_brand.uid
    fill_in "User", with: @vehicule_brand.user_id
    click_on "Update Vehicule brand"

    assert_text "Vehicule brand was successfully updated"
    click_on "Back"
  end

  test "destroying a Vehicule brand" do
    visit vehicule_brands_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Vehicule brand was successfully destroyed"
  end
end
