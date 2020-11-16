require "application_system_test_case"

class InterventionTypesTest < ApplicationSystemTestCase
  setup do
    @intervention_type = intervention_types(:one)
  end

  test "visiting the index" do
    visit intervention_types_url
    assert_selector "h1", text: "Intervention Types"
  end

  test "creating a Intervention type" do
    visit intervention_types_url
    click_on "New Intervention Type"

    fill_in "Description", with: @intervention_type.description
    fill_in "Name", with: @intervention_type.name
    fill_in "Status", with: @intervention_type.status
    fill_in "Uid", with: @intervention_type.uid
    fill_in "User", with: @intervention_type.user_id
    click_on "Create Intervention type"

    assert_text "Intervention type was successfully created"
    click_on "Back"
  end

  test "updating a Intervention type" do
    visit intervention_types_url
    click_on "Edit", match: :first

    fill_in "Description", with: @intervention_type.description
    fill_in "Name", with: @intervention_type.name
    fill_in "Status", with: @intervention_type.status
    fill_in "Uid", with: @intervention_type.uid
    fill_in "User", with: @intervention_type.user_id
    click_on "Update Intervention type"

    assert_text "Intervention type was successfully updated"
    click_on "Back"
  end

  test "destroying a Intervention type" do
    visit intervention_types_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Intervention type was successfully destroyed"
  end
end
