require 'test_helper'

class StandingControllerTest < ActionDispatch::IntegrationTest
  test "should get show" do
    get standing_show_url
    assert_response :success
  end

end
