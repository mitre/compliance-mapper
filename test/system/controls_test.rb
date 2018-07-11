require "application_system_test_case"

class ControlsTest < ApplicationSystemTestCase
  setup do
    @control = controls(:one)
  end

  test "visiting the index" do
    visit controls_url
    assert_selector "h1", text: "Controls"
  end

  test "creating a Control" do
    visit controls_url
    click_on "New Control"

    fill_in "Description", with: @control.description
    fill_in "Publisher", with: @control.publisher
    fill_in "Title", with: @control.title
    click_on "Create Control"

    assert_text "Control was successfully created"
    click_on "Back"
  end

  test "updating a Control" do
    visit controls_url
    click_on "Edit", match: :first

    fill_in "Description", with: @control.description
    fill_in "Publisher", with: @control.publisher
    fill_in "Title", with: @control.title
    click_on "Update Control"

    assert_text "Control was successfully updated"
    click_on "Back"
  end

  test "destroying a Control" do
    visit controls_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Control was successfully destroyed"
  end
end
