require 'test_helper'

class IacontrolsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @iacontrol = iacontrols(:one)
  end

  test "should get index" do
    get iacontrols_url
    assert_response :success
  end

  test "should get new" do
    get new_iacontrol_url
    assert_response :success
  end

  test "should create iacontrol" do
    assert_difference('Iacontrol.count') do
      post iacontrols_url, params: { iacontrol: { controlSubjectArea: @iacontrol.controlSubjectArea, description: @iacontrol.description, impact: @iacontrol.impact, name: @iacontrol.name, nistcontrolnumber: @iacontrol.nistcontrolnumber, number: @iacontrol.number } }
    end

    assert_redirected_to iacontrol_url(Iacontrol.last)
  end

  test "should show iacontrol" do
    get iacontrol_url(@iacontrol)
    assert_response :success
  end

  test "should get edit" do
    get edit_iacontrol_url(@iacontrol)
    assert_response :success
  end

  test "should update iacontrol" do
    patch iacontrol_url(@iacontrol), params: { iacontrol: { controlSubjectArea: @iacontrol.controlSubjectArea, description: @iacontrol.description, impact: @iacontrol.impact, name: @iacontrol.name, nistcontrolnumber: @iacontrol.nistcontrolnumber, number: @iacontrol.number } }
    assert_redirected_to iacontrol_url(@iacontrol)
  end

  test "should destroy iacontrol" do
    assert_difference('Iacontrol.count', -1) do
      delete iacontrol_url(@iacontrol)
    end

    assert_redirected_to iacontrols_url
  end
end
