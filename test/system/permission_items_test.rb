require "application_system_test_case"

class PermissionItemsTest < ApplicationSystemTestCase
  setup do
    @permission_item = permission_items(:one)
  end

  test "visiting the index" do
    visit permission_items_url
    assert_selector "h1", text: "Permission Items"
  end

  test "creating a Permission item" do
    visit permission_items_url
    click_on "New Permission Item"

    click_on "Create Permission item"

    assert_text "Permission item was successfully created"
    click_on "Back"
  end

  test "updating a Permission item" do
    visit permission_items_url
    click_on "Edit", match: :first

    click_on "Update Permission item"

    assert_text "Permission item was successfully updated"
    click_on "Back"
  end

  test "destroying a Permission item" do
    visit permission_items_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Permission item was successfully destroyed"
  end
end
