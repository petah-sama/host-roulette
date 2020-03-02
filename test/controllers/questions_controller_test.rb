require 'test_helper'

class QuestionsControllerTest < ActionDispatch::IntegrationTest
  test "should get create" do
    get questions_create_url
    assert_response :success
  end

end
