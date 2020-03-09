require 'test_helper'

class NotificationsControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get notifications_index_url
    assert_response :success
  end

  test "should get create" do
    get notifications_create_url
    assert_response :success
  end

  test "should get destroy" do
    get notifications_destroy_url
    assert_response :success
  end

end
