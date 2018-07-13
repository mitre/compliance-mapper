require "application_system_test_case"

class MappingsTest < ApplicationSystemTestCase
  setup do
    @mapping = mappings(:one)
  end

  test "visiting the index" do
    visit mappings_url
    assert_selector "h1", text: "Mappings"
  end

  test "creating a Mapping" do
    visit mappings_url
    click_on "New Mapping"

    click_on "Create Mapping"

    assert_text "Mapping was successfully created"
    click_on "Back"
  end

  test "updating a Mapping" do
    visit mappings_url
    click_on "Edit", match: :first

    click_on "Update Mapping"

    assert_text "Mapping was successfully updated"
    click_on "Back"
  end

  test "destroying a Mapping" do
    visit mappings_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Mapping was successfully destroyed"
  end
end
