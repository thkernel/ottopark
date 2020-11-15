require "application_system_test_case"

class ShiftingsTest < ApplicationSystemTestCase
  setup do
    @shifting = shiftings(:one)
  end

  test "visiting the index" do
    visit shiftings_url
    assert_selector "h1", text: "Shiftings"
  end

  test "creating a Shifting" do
    visit shiftings_url
    click_on "New Shifting"

    fill_in "Arrival", with: @shifting.arrival
    fill_in "Departure", with: @shifting.departure
    fill_in "Description", with: @shifting.description
    fill_in "Motif", with: @shifting.motif
    fill_in "Status", with: @shifting.status
    fill_in "User", with: @shifting.user_id
    fill_in "Vehicule", with: @shifting.vehicule_id
    click_on "Create Shifting"

    assert_text "Shifting was successfully created"
    click_on "Back"
  end

  test "updating a Shifting" do
    visit shiftings_url
    click_on "Edit", match: :first

    fill_in "Arrival", with: @shifting.arrival
    fill_in "Departure", with: @shifting.departure
    fill_in "Description", with: @shifting.description
    fill_in "Motif", with: @shifting.motif
    fill_in "Status", with: @shifting.status
    fill_in "User", with: @shifting.user_id
    fill_in "Vehicule", with: @shifting.vehicule_id
    click_on "Update Shifting"

    assert_text "Shifting was successfully updated"
    click_on "Back"
  end

  test "destroying a Shifting" do
    visit shiftings_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Shifting was successfully destroyed"
  end
end
