require "application_system_test_case"

class NistcontrolsTest < ApplicationSystemTestCase
  setup do
    @nistcontrol = nistcontrols(:one)
  end

  test "visiting the index" do
    visit nistcontrols_url
    assert_selector "h1", text: "Nistcontrols"
  end

  test "creating a Nistcontrol" do
    visit nistcontrols_url
    click_on "New Nistcontrol"

    fill_in "Basestatement", with: @nistcontrol.basestatement
    fill_in "Family", with: @nistcontrol.family
    fill_in "Number", with: @nistcontrol.number
    fill_in "Priority", with: @nistcontrol.priority
    fill_in "Title", with: @nistcontrol.title
    fill_in "Withdrawn", with: @nistcontrol.withdrawn
    click_on "Create Nistcontrol"

    assert_text "Nistcontrol was successfully created"
    click_on "Back"
  end

  test "updating a Nistcontrol" do
    visit nistcontrols_url
    click_on "Edit", match: :first

    fill_in "Basestatement", with: @nistcontrol.basestatement
    fill_in "Family", with: @nistcontrol.family
    fill_in "Number", with: @nistcontrol.number
    fill_in "Priority", with: @nistcontrol.priority
    fill_in "Title", with: @nistcontrol.title
    fill_in "Withdrawn", with: @nistcontrol.withdrawn
    click_on "Update Nistcontrol"

    assert_text "Nistcontrol was successfully updated"
    click_on "Back"
  end

  test "destroying a Nistcontrol" do
    visit nistcontrols_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Nistcontrol was successfully destroyed"
  end
end
