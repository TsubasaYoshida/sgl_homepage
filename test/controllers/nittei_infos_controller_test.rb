require 'test_helper'

class NitteiInfosControllerTest < ActionDispatch::IntegrationTest
  setup do
    @nittei_info = nittei_infos(:one)
  end

  test "should get index" do
    get nittei_infos_url
    assert_response :success
  end

  test "should get new" do
    get new_nittei_info_url
    assert_response :success
  end

  test "should create nittei_info" do
    assert_difference('NitteiInfo.count') do
      post nittei_infos_url, params: { nittei_info: { bottom_team_1: @nittei_info.bottom_team_1, disp_date: @nittei_info.disp_date, event: @nittei_info.event, message_1: @nittei_info.message_1, rain_date_flag: @nittei_info.rain_date_flag, season: @nittei_info.season, stadium: @nittei_info.stadium, start_time_1: @nittei_info.start_time_1, top_team_1: @nittei_info.top_team_1 } }
    end

    assert_redirected_to nittei_info_url(NitteiInfo.last)
  end

  test "should show nittei_info" do
    get nittei_info_url(@nittei_info)
    assert_response :success
  end

  test "should get edit" do
    get edit_nittei_info_url(@nittei_info)
    assert_response :success
  end

  test "should update nittei_info" do
    patch nittei_info_url(@nittei_info), params: { nittei_info: { bottom_team_1: @nittei_info.bottom_team_1, disp_date: @nittei_info.disp_date, event: @nittei_info.event, message_1: @nittei_info.message_1, rain_date_flag: @nittei_info.rain_date_flag, season: @nittei_info.season, stadium: @nittei_info.stadium, start_time_1: @nittei_info.start_time_1, top_team_1: @nittei_info.top_team_1 } }
    assert_redirected_to nittei_info_url(@nittei_info)
  end

  test "should destroy nittei_info" do
    assert_difference('NitteiInfo.count', -1) do
      delete nittei_info_url(@nittei_info)
    end

    assert_redirected_to nittei_infos_url
  end
end
