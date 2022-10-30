require "test_helper"

class StakesControllerTest < ActionDispatch::IntegrationTest
  test "should get show" do
    get stakes_show_url
    assert_response :success
  end
end
