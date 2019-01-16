require 'test_helper'

class AwardPlayersControllerTest < ActionDispatch::IntegrationTest
  setup do
    @award_player = award_players(:one)
  end

  test "should get index" do
    get award_players_url
    assert_response :success
  end

  test "should get new" do
    get new_award_player_url
    assert_response :success
  end

  test "should create award_player" do
    assert_difference('AwardPlayer.count') do
      post award_players_url, params: { award_player: { award: @award_player.award, award_info_id: @award_player.award_info_id, grade: @award_player.grade, player: @award_player.player, remarks: @award_player.remarks, team: @award_player.team } }
    end

    assert_redirected_to award_player_url(AwardPlayer.last)
  end

  test "should show award_player" do
    get award_player_url(@award_player)
    assert_response :success
  end

  test "should get edit" do
    get edit_award_player_url(@award_player)
    assert_response :success
  end

  test "should update award_player" do
    patch award_player_url(@award_player), params: { award_player: { award: @award_player.award, award_info_id: @award_player.award_info_id, grade: @award_player.grade, player: @award_player.player, remarks: @award_player.remarks, team: @award_player.team } }
    assert_redirected_to award_player_url(@award_player)
  end

  test "should destroy award_player" do
    assert_difference('AwardPlayer.count', -1) do
      delete award_player_url(@award_player)
    end

    assert_redirected_to award_players_url
  end
end
