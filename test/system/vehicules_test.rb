require "application_system_test_case"

class VehiculesTest < ApplicationSystemTestCase
  setup do
    @vehicule = vehicules(:one)
  end

  test "visiting the index" do
    visit vehicules_url
    assert_selector "h1", text: "Vehicules"
  end

  test "creating a Vehicule" do
    visit vehicules_url
    click_on "New Vehicule"

    fill_in "Chassis number", with: @vehicule.chassis_number
    fill_in "Color", with: @vehicule.color
    fill_in "Geographic location", with: @vehicule.geographic_location
    fill_in "Immatriculation number", with: @vehicule.immatriculation_number
    fill_in "Manufacture date", with: @vehicule.manufacture_date
    fill_in "Mileage", with: @vehicule.mileage
    fill_in "Serial number", with: @vehicule.serial_number
    fill_in "Statut", with: @vehicule.statut
    fill_in "Uid", with: @vehicule.uid
    fill_in "User", with: @vehicule.user_id
    fill_in "Vehicule brand", with: @vehicule.vehicule_brand_id
    fill_in "Vehicule model", with: @vehicule.vehicule_model
    fill_in "Vehicule type", with: @vehicule.vehicule_type_id
    click_on "Create Vehicule"

    assert_text "Vehicule was successfully created"
    click_on "Back"
  end

  test "updating a Vehicule" do
    visit vehicules_url
    click_on "Edit", match: :first

    fill_in "Chassis number", with: @vehicule.chassis_number
    fill_in "Color", with: @vehicule.color
    fill_in "Geographic location", with: @vehicule.geographic_location
    fill_in "Immatriculation number", with: @vehicule.immatriculation_number
    fill_in "Manufacture date", with: @vehicule.manufacture_date
    fill_in "Mileage", with: @vehicule.mileage
    fill_in "Serial number", with: @vehicule.serial_number
    fill_in "Statut", with: @vehicule.statut
    fill_in "Uid", with: @vehicule.uid
    fill_in "User", with: @vehicule.user_id
    fill_in "Vehicule brand", with: @vehicule.vehicule_brand_id
    fill_in "Vehicule model", with: @vehicule.vehicule_model
    fill_in "Vehicule type", with: @vehicule.vehicule_type_id
    click_on "Update Vehicule"

    assert_text "Vehicule was successfully updated"
    click_on "Back"
  end

  test "destroying a Vehicule" do
    visit vehicules_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Vehicule was successfully destroyed"
  end
end
