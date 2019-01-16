require 'test_helper'

class AwardInfosControllerTest < ActionDispatch::IntegrationTest
  setup do
    @award_info = award_infos(:one)
  end

  test "should get index" do
    get award_infos_url
    assert_response :success
  end

  test "should get new" do
    get new_award_info_url
    assert_response :success
  end

  test "should create award_info" do
    assert_difference('AwardInfo.count') do
      post award_infos_url, params: { award_info: { event: @award_info.event, season: @award_info.season, year: @award_info.year } }
    end

    assert_redirected_to award_info_url(AwardInfo.last)
  end

  test "should show award_info" do
    get award_info_url(@award_info)
    assert_response :success
  end

  test "should get edit" do
    get edit_award_info_url(@award_info)
    assert_response :success
  end

  test "should update award_info" do
    patch award_info_url(@award_info), params: { award_info: { event: @award_info.event, season: @award_info.season, year: @award_info.year } }
    assert_redirected_to award_info_url(@award_info)
  end

  test "should destroy award_info" do
    assert_difference('AwardInfo.count', -1) do
      delete award_info_url(@award_info)
    end

    assert_redirected_to award_infos_url
  end
end
