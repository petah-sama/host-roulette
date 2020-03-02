require 'test_helper'

class EventTagsControllerTest < ActionDispatch::IntegrationTest
  test "should get create" do
    get event_tags_create_url
    assert_response :success
  end

  test "should get destroy" do
    get event_tags_destroy_url
    assert_response :success
  end

end
