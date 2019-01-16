require 'test_helper'

class AwardControllerTest < ActionDispatch::IntegrationTest
  test "should get show" do
    get award_show_url
    assert_response :success
  end

end
