require 'test_helper'

class NitteiControllerTest < ActionDispatch::IntegrationTest
  test "should get show" do
    get nittei_show_url
    assert_response :success
  end

end
