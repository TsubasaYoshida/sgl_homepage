require "application_system_test_case"

class AwardPlayersTest < ApplicationSystemTestCase
  setup do
    @award_player = award_players(:one)
  end

  test "visiting the index" do
    visit award_players_url
    assert_selector "h1", text: "Award Players"
  end

  test "creating a Award player" do
    visit award_players_url
    click_on "New Award Player"

    fill_in "Award", with: @award_player.award
    fill_in "Award Info", with: @award_player.award_info_id
    fill_in "Grade", with: @award_player.grade
    fill_in "Player", with: @award_player.player
    fill_in "Remarks", with: @award_player.remarks
    fill_in "Team", with: @award_player.team
    click_on "Create Award player"

    assert_text "Award player was successfully created"
    click_on "Back"
  end

  test "updating a Award player" do
    visit award_players_url
    click_on "Edit", match: :first

    fill_in "Award", with: @award_player.award
    fill_in "Award Info", with: @award_player.award_info_id
    fill_in "Grade", with: @award_player.grade
    fill_in "Player", with: @award_player.player
    fill_in "Remarks", with: @award_player.remarks
    fill_in "Team", with: @award_player.team
    click_on "Update Award player"

    assert_text "Award player was successfully updated"
    click_on "Back"
  end

  test "destroying a Award player" do
    visit award_players_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Award player was successfully destroyed"
  end
end
