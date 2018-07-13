require "application_system_test_case"

class IacontrolsTest < ApplicationSystemTestCase
  setup do
    @iacontrol = iacontrols(:one)
  end

  test "visiting the index" do
    visit iacontrols_url
    assert_selector "h1", text: "Iacontrols"
  end

  test "creating a Iacontrol" do
    visit iacontrols_url
    click_on "New Iacontrol"

    fill_in "Controlsubjectarea", with: @iacontrol.controlSubjectArea
    fill_in "Description", with: @iacontrol.description
    fill_in "Impact", with: @iacontrol.impact
    fill_in "Name", with: @iacontrol.name
    fill_in "Nistcontrolnumber", with: @iacontrol.nistcontrolnumber
    fill_in "Number", with: @iacontrol.number
    click_on "Create Iacontrol"

    assert_text "Iacontrol was successfully created"
    click_on "Back"
  end

  test "updating a Iacontrol" do
    visit iacontrols_url
    click_on "Edit", match: :first

    fill_in "Controlsubjectarea", with: @iacontrol.controlSubjectArea
    fill_in "Description", with: @iacontrol.description
    fill_in "Impact", with: @iacontrol.impact
    fill_in "Name", with: @iacontrol.name
    fill_in "Nistcontrolnumber", with: @iacontrol.nistcontrolnumber
    fill_in "Number", with: @iacontrol.number
    click_on "Update Iacontrol"

    assert_text "Iacontrol was successfully updated"
    click_on "Back"
  end

  test "destroying a Iacontrol" do
    visit iacontrols_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Iacontrol was successfully destroyed"
  end
end
