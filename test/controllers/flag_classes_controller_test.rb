require 'test_helper'

class FlagClassesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @flag_class = flag_classes(:one)
  end

  test "should get index" do
    get flag_classes_url
    assert_response :success
  end

  test "should get new" do
    get new_flag_class_url
    assert_response :success
  end

  test "should create flag_class" do
    assert_difference('FlagClass.count') do
      post flag_classes_url, params: { flag_class: { name: @flag_class.name } }
    end

    assert_redirected_to flag_class_url(FlagClass.last)
  end

  test "should show flag_class" do
    get flag_class_url(@flag_class)
    assert_response :success
  end

  test "should get edit" do
    get edit_flag_class_url(@flag_class)
    assert_response :success
  end

  test "should update flag_class" do
    patch flag_class_url(@flag_class), params: { flag_class: { name: @flag_class.name } }
    assert_redirected_to flag_class_url(@flag_class)
  end

  test "should destroy flag_class" do
    assert_difference('FlagClass.count', -1) do
      delete flag_class_url(@flag_class)
    end

    assert_redirected_to flag_classes_url
  end
end
