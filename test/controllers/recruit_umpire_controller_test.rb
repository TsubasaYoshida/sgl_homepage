require 'test_helper'

class RecruitUmpireControllerTest < ActionDispatch::IntegrationTest
  test "should get show" do
    get recruit_umpire_show_url
    assert_response :success
  end

end
