require "test_helper"

class PlayControllerTest < ActionDispatch::IntegrationTest
  test "should get display" do
    get play_display_url
    assert_response :success
  end
end
