require "application_system_test_case"

class VehicleTypesTest < ApplicationSystemTestCase
  setup do
    @vehicle_type = vehicle_types(:one)
  end

  test "visiting the index" do
    visit vehicle_types_url
    assert_selector "h1", text: "Vehicle Types"
  end

  test "creating a Vehicle type" do
    visit vehicle_types_url
    click_on "New Vehicle Type"

    fill_in "Description", with: @vehicle_type.description
    fill_in "Name", with: @vehicle_type.name
    fill_in "Status", with: @vehicle_type.status
    fill_in "Uid", with: @vehicle_type.uid
    fill_in "User", with: @vehicle_type.user_id
    click_on "Create Vehicle type"

    assert_text "Vehicle type was successfully created"
    click_on "Back"
  end

  test "updating a Vehicle type" do
    visit vehicle_types_url
    click_on "Edit", match: :first

    fill_in "Description", with: @vehicle_type.description
    fill_in "Name", with: @vehicle_type.name
    fill_in "Status", with: @vehicle_type.status
    fill_in "Uid", with: @vehicle_type.uid
    fill_in "User", with: @vehicle_type.user_id
    click_on "Update Vehicle type"

    assert_text "Vehicle type was successfully updated"
    click_on "Back"
  end

  test "destroying a Vehicle type" do
    visit vehicle_types_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Vehicle type was successfully destroyed"
  end
end
