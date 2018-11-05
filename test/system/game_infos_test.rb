require "application_system_test_case"

class GameInfosTest < ApplicationSystemTestCase
  setup do
    @game_info = game_infos(:one)
  end

  test "visiting the index" do
    visit game_infos_url
    assert_selector "h1", text: "Game Infos"
  end

  test "creating a Game info" do
    visit game_infos_url
    click_on "New Game Info"

    fill_in "Batting First Team", with: @game_info.batting_first_team
    fill_in "Bottom1", with: @game_info.bottom1
    fill_in "Bottom10", with: @game_info.bottom10
    fill_in "Bottom11", with: @game_info.bottom11
    fill_in "Bottom12", with: @game_info.bottom12
    fill_in "Bottom13", with: @game_info.bottom13
    fill_in "Bottom14", with: @game_info.bottom14
    fill_in "Bottom15", with: @game_info.bottom15
    fill_in "Bottom2", with: @game_info.bottom2
    fill_in "Bottom3", with: @game_info.bottom3
    fill_in "Bottom4", with: @game_info.bottom4
    fill_in "Bottom5", with: @game_info.bottom5
    fill_in "Bottom6", with: @game_info.bottom6
    fill_in "Bottom7", with: @game_info.bottom7
    fill_in "Bottom8", with: @game_info.bottom8
    fill_in "Bottom9", with: @game_info.bottom9
    fill_in "Catcher Bottom", with: @game_info.catcher_bottom
    fill_in "Catcher Top", with: @game_info.catcher_top
    fill_in "Disp Date", with: @game_info.disp_date
    fill_in "End Time", with: @game_info.end_time
    fill_in "Event", with: @game_info.event
    fill_in "Field First Team", with: @game_info.field_first_team
    fill_in "Gameset Flag", with: @game_info.gameset_flag
    fill_in "Homerun Bottom", with: @game_info.homerun_bottom
    fill_in "Homerun Top", with: @game_info.homerun_top
    fill_in "Message", with: @game_info.message
    fill_in "Number", with: @game_info.number
    fill_in "Pitcher Bottom", with: @game_info.pitcher_bottom
    fill_in "Pitcher Top", with: @game_info.pitcher_top
    fill_in "Round", with: @game_info.round
    fill_in "Stadium", with: @game_info.stadium
    fill_in "Start Time", with: @game_info.start_time
    fill_in "Threebase Bottom", with: @game_info.threebase_bottom
    fill_in "Threebase Top", with: @game_info.threebase_top
    fill_in "Top1", with: @game_info.top1
    fill_in "Top10", with: @game_info.top10
    fill_in "Top11", with: @game_info.top11
    fill_in "Top12", with: @game_info.top12
    fill_in "Top13", with: @game_info.top13
    fill_in "Top14", with: @game_info.top14
    fill_in "Top15", with: @game_info.top15
    fill_in "Top2", with: @game_info.top2
    fill_in "Top3", with: @game_info.top3
    fill_in "Top4", with: @game_info.top4
    fill_in "Top5", with: @game_info.top5
    fill_in "Top6", with: @game_info.top6
    fill_in "Top7", with: @game_info.top7
    fill_in "Top8", with: @game_info.top8
    fill_in "Top9", with: @game_info.top9
    fill_in "Twobase Bottom", with: @game_info.twobase_bottom
    fill_in "Twobase Top", with: @game_info.twobase_top
    click_on "Create Game info"

    assert_text "Game info was successfully created"
    click_on "Back"
  end

  test "updating a Game info" do
    visit game_infos_url
    click_on "Edit", match: :first

    fill_in "Batting First Team", with: @game_info.batting_first_team
    fill_in "Bottom1", with: @game_info.bottom1
    fill_in "Bottom10", with: @game_info.bottom10
    fill_in "Bottom11", with: @game_info.bottom11
    fill_in "Bottom12", with: @game_info.bottom12
    fill_in "Bottom13", with: @game_info.bottom13
    fill_in "Bottom14", with: @game_info.bottom14
    fill_in "Bottom15", with: @game_info.bottom15
    fill_in "Bottom2", with: @game_info.bottom2
    fill_in "Bottom3", with: @game_info.bottom3
    fill_in "Bottom4", with: @game_info.bottom4
    fill_in "Bottom5", with: @game_info.bottom5
    fill_in "Bottom6", with: @game_info.bottom6
    fill_in "Bottom7", with: @game_info.bottom7
    fill_in "Bottom8", with: @game_info.bottom8
    fill_in "Bottom9", with: @game_info.bottom9
    fill_in "Catcher Bottom", with: @game_info.catcher_bottom
    fill_in "Catcher Top", with: @game_info.catcher_top
    fill_in "Disp Date", with: @game_info.disp_date
    fill_in "End Time", with: @game_info.end_time
    fill_in "Event", with: @game_info.event
    fill_in "Field First Team", with: @game_info.field_first_team
    fill_in "Gameset Flag", with: @game_info.gameset_flag
    fill_in "Homerun Bottom", with: @game_info.homerun_bottom
    fill_in "Homerun Top", with: @game_info.homerun_top
    fill_in "Message", with: @game_info.message
    fill_in "Number", with: @game_info.number
    fill_in "Pitcher Bottom", with: @game_info.pitcher_bottom
    fill_in "Pitcher Top", with: @game_info.pitcher_top
    fill_in "Round", with: @game_info.round
    fill_in "Stadium", with: @game_info.stadium
    fill_in "Start Time", with: @game_info.start_time
    fill_in "Threebase Bottom", with: @game_info.threebase_bottom
    fill_in "Threebase Top", with: @game_info.threebase_top
    fill_in "Top1", with: @game_info.top1
    fill_in "Top10", with: @game_info.top10
    fill_in "Top11", with: @game_info.top11
    fill_in "Top12", with: @game_info.top12
    fill_in "Top13", with: @game_info.top13
    fill_in "Top14", with: @game_info.top14
    fill_in "Top15", with: @game_info.top15
    fill_in "Top2", with: @game_info.top2
    fill_in "Top3", with: @game_info.top3
    fill_in "Top4", with: @game_info.top4
    fill_in "Top5", with: @game_info.top5
    fill_in "Top6", with: @game_info.top6
    fill_in "Top7", with: @game_info.top7
    fill_in "Top8", with: @game_info.top8
    fill_in "Top9", with: @game_info.top9
    fill_in "Twobase Bottom", with: @game_info.twobase_bottom
    fill_in "Twobase Top", with: @game_info.twobase_top
    click_on "Update Game info"

    assert_text "Game info was successfully updated"
    click_on "Back"
  end

  test "destroying a Game info" do
    visit game_infos_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Game info was successfully destroyed"
  end
end
