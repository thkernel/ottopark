require "application_system_test_case"

class InsurancesTest < ApplicationSystemTestCase
  setup do
    @insurance = insurances(:one)
  end

  test "visiting the index" do
    visit insurances_url
    assert_selector "h1", text: "Insurances"
  end

  test "creating a Insurance" do
    visit insurances_url
    click_on "New Insurance"

    fill_in "Amount including tax", with: @insurance.amount_including_tax
    fill_in "End date", with: @insurance.end_date
    fill_in "Insurance number", with: @insurance.insurance_number
    fill_in "Insurer", with: @insurance.insurer_id
    fill_in "Pre tax amount", with: @insurance.pre_tax_amount
    fill_in "Start date", with: @insurance.start_date
    fill_in "Status", with: @insurance.status
    fill_in "User", with: @insurance.user_id
    fill_in "Vat rate", with: @insurance.vat_rate
    fill_in "Vehicule", with: @insurance.vehicule_id
    click_on "Create Insurance"

    assert_text "Insurance was successfully created"
    click_on "Back"
  end

  test "updating a Insurance" do
    visit insurances_url
    click_on "Edit", match: :first

    fill_in "Amount including tax", with: @insurance.amount_including_tax
    fill_in "End date", with: @insurance.end_date
    fill_in "Insurance number", with: @insurance.insurance_number
    fill_in "Insurer", with: @insurance.insurer_id
    fill_in "Pre tax amount", with: @insurance.pre_tax_amount
    fill_in "Start date", with: @insurance.start_date
    fill_in "Status", with: @insurance.status
    fill_in "User", with: @insurance.user_id
    fill_in "Vat rate", with: @insurance.vat_rate
    fill_in "Vehicule", with: @insurance.vehicule_id
    click_on "Update Insurance"

    assert_text "Insurance was successfully updated"
    click_on "Back"
  end

  test "destroying a Insurance" do
    visit insurances_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Insurance was successfully destroyed"
  end
end
