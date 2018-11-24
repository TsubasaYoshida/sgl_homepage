require "application_system_test_case"

class EventOneDaysTest < ApplicationSystemTestCase
  setup do
    @event_one_day = event_one_days(:one)
  end

  test "visiting the index" do
    visit event_one_days_url
    assert_selector "h1", text: "Event One Days"
  end

  test "creating a Event one day" do
    visit event_one_days_url
    click_on "New Event One Day"

    fill_in "Bottom Team 1", with: @event_one_day.bottom_team_1
    fill_in "Bottom Team 2", with: @event_one_day.bottom_team_2
    fill_in "Bottom Team 3", with: @event_one_day.bottom_team_3
    fill_in "Disp Date", with: @event_one_day.disp_date
    fill_in "Event Info", with: @event_one_day.event_info_id
    fill_in "Message 1", with: @event_one_day.message_1
    fill_in "Message 2", with: @event_one_day.message_2
    fill_in "Message 3", with: @event_one_day.message_3
    fill_in "Rain Date Flag", with: @event_one_day.rain_date_flag
    fill_in "Round 1", with: @event_one_day.round_1
    fill_in "Round 2", with: @event_one_day.round_2
    fill_in "Round 3", with: @event_one_day.round_3
    fill_in "Stadium", with: @event_one_day.stadium
    fill_in "Start Time 1", with: @event_one_day.start_time_1
    fill_in "Start Time 2", with: @event_one_day.start_time_2
    fill_in "Start Time 3", with: @event_one_day.start_time_3
    fill_in "Top Team 1", with: @event_one_day.top_team_1
    fill_in "Top Team 2", with: @event_one_day.top_team_2
    fill_in "Top Team 3", with: @event_one_day.top_team_3
    click_on "Create Event one day"

    assert_text "Event one day was successfully created"
    click_on "Back"
  end

  test "updating a Event one day" do
    visit event_one_days_url
    click_on "Edit", match: :first

    fill_in "Bottom Team 1", with: @event_one_day.bottom_team_1
    fill_in "Bottom Team 2", with: @event_one_day.bottom_team_2
    fill_in "Bottom Team 3", with: @event_one_day.bottom_team_3
    fill_in "Disp Date", with: @event_one_day.disp_date
    fill_in "Event Info", with: @event_one_day.event_info_id
    fill_in "Message 1", with: @event_one_day.message_1
    fill_in "Message 2", with: @event_one_day.message_2
    fill_in "Message 3", with: @event_one_day.message_3
    fill_in "Rain Date Flag", with: @event_one_day.rain_date_flag
    fill_in "Round 1", with: @event_one_day.round_1
    fill_in "Round 2", with: @event_one_day.round_2
    fill_in "Round 3", with: @event_one_day.round_3
    fill_in "Stadium", with: @event_one_day.stadium
    fill_in "Start Time 1", with: @event_one_day.start_time_1
    fill_in "Start Time 2", with: @event_one_day.start_time_2
    fill_in "Start Time 3", with: @event_one_day.start_time_3
    fill_in "Top Team 1", with: @event_one_day.top_team_1
    fill_in "Top Team 2", with: @event_one_day.top_team_2
    fill_in "Top Team 3", with: @event_one_day.top_team_3
    click_on "Update Event one day"

    assert_text "Event one day was successfully updated"
    click_on "Back"
  end

  test "destroying a Event one day" do
    visit event_one_days_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Event one day was successfully destroyed"
  end
end
