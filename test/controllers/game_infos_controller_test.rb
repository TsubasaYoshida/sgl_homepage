require 'test_helper'

class GameInfosControllerTest < ActionDispatch::IntegrationTest
  setup do
    @game_info = game_infos(:one)
  end

  test "should get index" do
    get game_infos_url
    assert_response :success
  end

  test "should get new" do
    get new_game_info_url
    assert_response :success
  end

  test "should create game_info" do
    assert_difference('GameInfo.count') do
      post game_infos_url, params: { game_info: { batting_first_team: @game_info.batting_first_team, bottom1: @game_info.bottom1, bottom10: @game_info.bottom10, bottom11: @game_info.bottom11, bottom12: @game_info.bottom12, bottom13: @game_info.bottom13, bottom14: @game_info.bottom14, bottom15: @game_info.bottom15, bottom2: @game_info.bottom2, bottom3: @game_info.bottom3, bottom4: @game_info.bottom4, bottom5: @game_info.bottom5, bottom6: @game_info.bottom6, bottom7: @game_info.bottom7, bottom8: @game_info.bottom8, bottom9: @game_info.bottom9, catcher_bottom: @game_info.catcher_bottom, catcher_top: @game_info.catcher_top, disp_date: @game_info.disp_date, end_time: @game_info.end_time, event: @game_info.event, field_first_team: @game_info.field_first_team, gameset_flag: @game_info.gameset_flag, homerun_bottom: @game_info.homerun_bottom, homerun_top: @game_info.homerun_top, message: @game_info.message, number: @game_info.number, pitcher_bottom: @game_info.pitcher_bottom, pitcher_top: @game_info.pitcher_top, round: @game_info.round, stadium: @game_info.stadium, start_time: @game_info.start_time, threebase_bottom: @game_info.threebase_bottom, threebase_top: @game_info.threebase_top, top1: @game_info.top1, top10: @game_info.top10, top11: @game_info.top11, top12: @game_info.top12, top13: @game_info.top13, top14: @game_info.top14, top15: @game_info.top15, top2: @game_info.top2, top3: @game_info.top3, top4: @game_info.top4, top5: @game_info.top5, top6: @game_info.top6, top7: @game_info.top7, top8: @game_info.top8, top9: @game_info.top9, twobase_bottom: @game_info.twobase_bottom, twobase_top: @game_info.twobase_top } }
    end

    assert_redirected_to game_info_url(GameInfo.last)
  end

  test "should show game_info" do
    get game_info_url(@game_info)
    assert_response :success
  end

  test "should get edit" do
    get edit_game_info_url(@game_info)
    assert_response :success
  end

  test "should update game_info" do
    patch game_info_url(@game_info), params: { game_info: { batting_first_team: @game_info.batting_first_team, bottom1: @game_info.bottom1, bottom10: @game_info.bottom10, bottom11: @game_info.bottom11, bottom12: @game_info.bottom12, bottom13: @game_info.bottom13, bottom14: @game_info.bottom14, bottom15: @game_info.bottom15, bottom2: @game_info.bottom2, bottom3: @game_info.bottom3, bottom4: @game_info.bottom4, bottom5: @game_info.bottom5, bottom6: @game_info.bottom6, bottom7: @game_info.bottom7, bottom8: @game_info.bottom8, bottom9: @game_info.bottom9, catcher_bottom: @game_info.catcher_bottom, catcher_top: @game_info.catcher_top, disp_date: @game_info.disp_date, end_time: @game_info.end_time, event: @game_info.event, field_first_team: @game_info.field_first_team, gameset_flag: @game_info.gameset_flag, homerun_bottom: @game_info.homerun_bottom, homerun_top: @game_info.homerun_top, message: @game_info.message, number: @game_info.number, pitcher_bottom: @game_info.pitcher_bottom, pitcher_top: @game_info.pitcher_top, round: @game_info.round, stadium: @game_info.stadium, start_time: @game_info.start_time, threebase_bottom: @game_info.threebase_bottom, threebase_top: @game_info.threebase_top, top1: @game_info.top1, top10: @game_info.top10, top11: @game_info.top11, top12: @game_info.top12, top13: @game_info.top13, top14: @game_info.top14, top15: @game_info.top15, top2: @game_info.top2, top3: @game_info.top3, top4: @game_info.top4, top5: @game_info.top5, top6: @game_info.top6, top7: @game_info.top7, top8: @game_info.top8, top9: @game_info.top9, twobase_bottom: @game_info.twobase_bottom, twobase_top: @game_info.twobase_top } }
    assert_redirected_to game_info_url(@game_info)
  end

  test "should destroy game_info" do
    assert_difference('GameInfo.count', -1) do
      delete game_info_url(@game_info)
    end

    assert_redirected_to game_infos_url
  end
end
