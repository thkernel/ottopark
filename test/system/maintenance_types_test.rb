require "application_system_test_case"

class MaintenanceTypesTest < ApplicationSystemTestCase
  setup do
    @maintenance_type = maintenance_types(:one)
  end

  test "visiting the index" do
    visit maintenance_types_url
    assert_selector "h1", text: "Maintenance Types"
  end

  test "creating a Maintenance type" do
    visit maintenance_types_url
    click_on "New Maintenance Type"

    fill_in "Description", with: @maintenance_type.description
    fill_in "Name", with: @maintenance_type.name
    fill_in "Status", with: @maintenance_type.status
    fill_in "Uid", with: @maintenance_type.uid
    fill_in "User", with: @maintenance_type.user_id
    click_on "Create Maintenance type"

    assert_text "Maintenance type was successfully created"
    click_on "Back"
  end

  test "updating a Maintenance type" do
    visit maintenance_types_url
    click_on "Edit", match: :first

    fill_in "Description", with: @maintenance_type.description
    fill_in "Name", with: @maintenance_type.name
    fill_in "Status", with: @maintenance_type.status
    fill_in "Uid", with: @maintenance_type.uid
    fill_in "User", with: @maintenance_type.user_id
    click_on "Update Maintenance type"

    assert_text "Maintenance type was successfully updated"
    click_on "Back"
  end

  test "destroying a Maintenance type" do
    visit maintenance_types_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Maintenance type was successfully destroyed"
  end
end
