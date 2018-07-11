require 'test_helper'

class NistcontrolsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @nistcontrol = nistcontrols(:one)
  end

  test "should get index" do
    get nistcontrols_url
    assert_response :success
  end

  test "should get new" do
    get new_nistcontrol_url
    assert_response :success
  end

  test "should create nistcontrol" do
    assert_difference('Nistcontrol.count') do
      post nistcontrols_url, params: { nistcontrol: { basestatement: @nistcontrol.basestatement, family: @nistcontrol.family, number: @nistcontrol.number, priority: @nistcontrol.priority, title: @nistcontrol.title, withdrawn: @nistcontrol.withdrawn } }
    end

    assert_redirected_to nistcontrol_url(Nistcontrol.last)
  end

  test "should show nistcontrol" do
    get nistcontrol_url(@nistcontrol)
    assert_response :success
  end

  test "should get edit" do
    get edit_nistcontrol_url(@nistcontrol)
    assert_response :success
  end

  test "should update nistcontrol" do
    patch nistcontrol_url(@nistcontrol), params: { nistcontrol: { basestatement: @nistcontrol.basestatement, family: @nistcontrol.family, number: @nistcontrol.number, priority: @nistcontrol.priority, title: @nistcontrol.title, withdrawn: @nistcontrol.withdrawn } }
    assert_redirected_to nistcontrol_url(@nistcontrol)
  end

  test "should destroy nistcontrol" do
    assert_difference('Nistcontrol.count', -1) do
      delete nistcontrol_url(@nistcontrol)
    end

    assert_redirected_to nistcontrols_url
  end
end
