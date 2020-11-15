require "application_system_test_case"

class InsurersTest < ApplicationSystemTestCase
  setup do
    @insurer = insurers(:one)
  end

  test "visiting the index" do
    visit insurers_url
    assert_selector "h1", text: "Insurers"
  end

  test "creating a Insurer" do
    visit insurers_url
    click_on "New Insurer"

    fill_in "Address", with: @insurer.address
    fill_in "City", with: @insurer.city
    fill_in "Country", with: @insurer.country
    fill_in "Email", with: @insurer.email
    fill_in "Name", with: @insurer.name
    fill_in "Phone", with: @insurer.phone
    fill_in "Status", with: @insurer.status
    fill_in "Uid", with: @insurer.uid
    fill_in "User", with: @insurer.user_id
    click_on "Create Insurer"

    assert_text "Insurer was successfully created"
    click_on "Back"
  end

  test "updating a Insurer" do
    visit insurers_url
    click_on "Edit", match: :first

    fill_in "Address", with: @insurer.address
    fill_in "City", with: @insurer.city
    fill_in "Country", with: @insurer.country
    fill_in "Email", with: @insurer.email
    fill_in "Name", with: @insurer.name
    fill_in "Phone", with: @insurer.phone
    fill_in "Status", with: @insurer.status
    fill_in "Uid", with: @insurer.uid
    fill_in "User", with: @insurer.user_id
    click_on "Update Insurer"

    assert_text "Insurer was successfully updated"
    click_on "Back"
  end

  test "destroying a Insurer" do
    visit insurers_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Insurer was successfully destroyed"
  end
end
