require "test_helper"

class Api::V1ControllerTest < ActionDispatch::IntegrationTest
  test "should get Users" do
    get api_v1_Users_url
    assert_response :success
  end
end
