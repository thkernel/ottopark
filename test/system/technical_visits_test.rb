require "application_system_test_case"

class TechnicalVisitsTest < ApplicationSystemTestCase
  setup do
    @technical_visit = technical_visits(:one)
  end

  test "visiting the index" do
    visit technical_visits_url
    assert_selector "h1", text: "Technical Visits"
  end

  test "creating a Technical visit" do
    visit technical_visits_url
    click_on "New Technical Visit"

    fill_in "Amount including tax", with: @technical_visit.amount_including_tax
    fill_in "End date", with: @technical_visit.end_date
    fill_in "Pre tax amount", with: @technical_visit.pre_tax_amount
    fill_in "Reference", with: @technical_visit.reference
    fill_in "Start date", with: @technical_visit.start_date
    fill_in "Status", with: @technical_visit.status
    fill_in "User", with: @technical_visit.user_id
    fill_in "Vat rate", with: @technical_visit.vat_rate
    fill_in "Vehicule", with: @technical_visit.vehicule_id
    click_on "Create Technical visit"

    assert_text "Technical visit was successfully created"
    click_on "Back"
  end

  test "updating a Technical visit" do
    visit technical_visits_url
    click_on "Edit", match: :first

    fill_in "Amount including tax", with: @technical_visit.amount_including_tax
    fill_in "End date", with: @technical_visit.end_date
    fill_in "Pre tax amount", with: @technical_visit.pre_tax_amount
    fill_in "Reference", with: @technical_visit.reference
    fill_in "Start date", with: @technical_visit.start_date
    fill_in "Status", with: @technical_visit.status
    fill_in "User", with: @technical_visit.user_id
    fill_in "Vat rate", with: @technical_visit.vat_rate
    fill_in "Vehicule", with: @technical_visit.vehicule_id
    click_on "Update Technical visit"

    assert_text "Technical visit was successfully updated"
    click_on "Back"
  end

  test "destroying a Technical visit" do
    visit technical_visits_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Technical visit was successfully destroyed"
  end
end
