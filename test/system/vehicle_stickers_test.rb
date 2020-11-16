require "application_system_test_case"

class VehicleStickersTest < ApplicationSystemTestCase
  setup do
    @vehicle_sticker = vehicle_stickers(:one)
  end

  test "visiting the index" do
    visit vehicle_stickers_url
    assert_selector "h1", text: "Vehicle Stickers"
  end

  test "creating a Vehicle sticker" do
    visit vehicle_stickers_url
    click_on "New Vehicle Sticker"

    fill_in "Amount including tax", with: @vehicle_sticker.amount_including_tax
    fill_in "End date", with: @vehicle_sticker.end_date
    fill_in "Pre tax amount", with: @vehicle_sticker.pre_tax_amount
    fill_in "Reference", with: @vehicle_sticker.reference
    fill_in "Start date", with: @vehicle_sticker.start_date
    fill_in "Status", with: @vehicle_sticker.status
    fill_in "User", with: @vehicle_sticker.user_id
    fill_in "Vat rate", with: @vehicle_sticker.vat_rate
    fill_in "Vehicule", with: @vehicle_sticker.vehicule_id
    click_on "Create Vehicle sticker"

    assert_text "Vehicle sticker was successfully created"
    click_on "Back"
  end

  test "updating a Vehicle sticker" do
    visit vehicle_stickers_url
    click_on "Edit", match: :first

    fill_in "Amount including tax", with: @vehicle_sticker.amount_including_tax
    fill_in "End date", with: @vehicle_sticker.end_date
    fill_in "Pre tax amount", with: @vehicle_sticker.pre_tax_amount
    fill_in "Reference", with: @vehicle_sticker.reference
    fill_in "Start date", with: @vehicle_sticker.start_date
    fill_in "Status", with: @vehicle_sticker.status
    fill_in "User", with: @vehicle_sticker.user_id
    fill_in "Vat rate", with: @vehicle_sticker.vat_rate
    fill_in "Vehicule", with: @vehicle_sticker.vehicule_id
    click_on "Update Vehicle sticker"

    assert_text "Vehicle sticker was successfully updated"
    click_on "Back"
  end

  test "destroying a Vehicle sticker" do
    visit vehicle_stickers_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Vehicle sticker was successfully destroyed"
  end
end
