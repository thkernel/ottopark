require "application_system_test_case"

class ConsumptionsTest < ApplicationSystemTestCase
  setup do
    @consumption = consumptions(:one)
  end

  test "visiting the index" do
    visit consumptions_url
    assert_selector "h1", text: "Consumptions"
  end

  test "creating a Consumption" do
    visit consumptions_url
    click_on "New Consumption"

    fill_in "Description", with: @consumption.description
    fill_in "Driver", with: @consumption.driver_id
    fill_in "Quantity", with: @consumption.quantity
    fill_in "Status", with: @consumption.status
    fill_in "Uid", with: @consumption.uid
    fill_in "Unit", with: @consumption.unit
    fill_in "User", with: @consumption.user_id
    fill_in "Vehicle", with: @consumption.vehicle_id
    click_on "Create Consumption"

    assert_text "Consumption was successfully created"
    click_on "Back"
  end

  test "updating a Consumption" do
    visit consumptions_url
    click_on "Edit", match: :first

    fill_in "Description", with: @consumption.description
    fill_in "Driver", with: @consumption.driver_id
    fill_in "Quantity", with: @consumption.quantity
    fill_in "Status", with: @consumption.status
    fill_in "Uid", with: @consumption.uid
    fill_in "Unit", with: @consumption.unit
    fill_in "User", with: @consumption.user_id
    fill_in "Vehicle", with: @consumption.vehicle_id
    click_on "Update Consumption"

    assert_text "Consumption was successfully updated"
    click_on "Back"
  end

  test "destroying a Consumption" do
    visit consumptions_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Consumption was successfully destroyed"
  end
end
