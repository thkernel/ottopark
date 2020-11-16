require "application_system_test_case"

class VehicleModelsTest < ApplicationSystemTestCase
  setup do
    @vehicle_model = vehicle_models(:one)
  end

  test "visiting the index" do
    visit vehicle_models_url
    assert_selector "h1", text: "Vehicle Models"
  end

  test "creating a Vehicle model" do
    visit vehicle_models_url
    click_on "New Vehicle Model"

    fill_in "Manufacturer", with: @vehicle_model.manufacturer
    fill_in "Name", with: @vehicle_model.name
    fill_in "Status", with: @vehicle_model.status
    fill_in "Uid", with: @vehicle_model.uid
    fill_in "User", with: @vehicle_model.user_id
    fill_in "Vehicle type", with: @vehicle_model.vehicle_type_id
    click_on "Create Vehicle model"

    assert_text "Vehicle model was successfully created"
    click_on "Back"
  end

  test "updating a Vehicle model" do
    visit vehicle_models_url
    click_on "Edit", match: :first

    fill_in "Manufacturer", with: @vehicle_model.manufacturer
    fill_in "Name", with: @vehicle_model.name
    fill_in "Status", with: @vehicle_model.status
    fill_in "Uid", with: @vehicle_model.uid
    fill_in "User", with: @vehicle_model.user_id
    fill_in "Vehicle type", with: @vehicle_model.vehicle_type_id
    click_on "Update Vehicle model"

    assert_text "Vehicle model was successfully updated"
    click_on "Back"
  end

  test "destroying a Vehicle model" do
    visit vehicle_models_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Vehicle model was successfully destroyed"
  end
end
