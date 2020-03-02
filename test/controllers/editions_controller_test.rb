require 'test_helper'

class EditionsControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get editions_index_url
    assert_response :success
  end

  test "should get show" do
    get editions_show_url
    assert_response :success
  end

  test "should get new" do
    get editions_new_url
    assert_response :success
  end

  test "should get create" do
    get editions_create_url
    assert_response :success
  end

  test "should get edit" do
    get editions_edit_url
    assert_response :success
  end

  test "should get update" do
    get editions_update_url
    assert_response :success
  end

  test "should get destroy" do
    get editions_destroy_url
    assert_response :success
  end

end
