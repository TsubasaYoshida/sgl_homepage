require "application_system_test_case"

class NitteiInfosTest < ApplicationSystemTestCase
  setup do
    @nittei_info = nittei_infos(:one)
  end

  test "visiting the index" do
    visit nittei_infos_url
    assert_selector "h1", text: "Nittei Infos"
  end

  test "creating a Nittei info" do
    visit nittei_infos_url
    click_on "New Nittei Info"

    fill_in "Bottom Team 1", with: @nittei_info.bottom_team_1
    fill_in "Disp Date", with: @nittei_info.disp_date
    fill_in "Event", with: @nittei_info.event
    fill_in "Message 1", with: @nittei_info.message_1
    fill_in "Rain Date Flag", with: @nittei_info.rain_date_flag
    fill_in "Season", with: @nittei_info.season
    fill_in "Stadium", with: @nittei_info.stadium
    fill_in "Start Time 1", with: @nittei_info.start_time_1
    fill_in "Top Team 1", with: @nittei_info.top_team_1
    click_on "Create Nittei info"

    assert_text "Nittei info was successfully created"
    click_on "Back"
  end

  test "updating a Nittei info" do
    visit nittei_infos_url
    click_on "Edit", match: :first

    fill_in "Bottom Team 1", with: @nittei_info.bottom_team_1
    fill_in "Disp Date", with: @nittei_info.disp_date
    fill_in "Event", with: @nittei_info.event
    fill_in "Message 1", with: @nittei_info.message_1
    fill_in "Rain Date Flag", with: @nittei_info.rain_date_flag
    fill_in "Season", with: @nittei_info.season
    fill_in "Stadium", with: @nittei_info.stadium
    fill_in "Start Time 1", with: @nittei_info.start_time_1
    fill_in "Top Team 1", with: @nittei_info.top_team_1
    click_on "Update Nittei info"

    assert_text "Nittei info was successfully updated"
    click_on "Back"
  end

  test "destroying a Nittei info" do
    visit nittei_infos_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Nittei info was successfully destroyed"
  end
end
