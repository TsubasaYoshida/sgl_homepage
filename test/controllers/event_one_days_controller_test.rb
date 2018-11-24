require 'test_helper'

class EventOneDaysControllerTest < ActionDispatch::IntegrationTest
  setup do
    @event_one_day = event_one_days(:one)
  end

  test "should get index" do
    get event_one_days_url
    assert_response :success
  end

  test "should get new" do
    get new_event_one_day_url
    assert_response :success
  end

  test "should create event_one_day" do
    assert_difference('EventOneDay.count') do
      post event_one_days_url, params: { event_one_day: { bottom_team_1: @event_one_day.bottom_team_1, bottom_team_2: @event_one_day.bottom_team_2, bottom_team_3: @event_one_day.bottom_team_3, disp_date: @event_one_day.disp_date, event_info_id: @event_one_day.event_info_id, message_1: @event_one_day.message_1, message_2: @event_one_day.message_2, message_3: @event_one_day.message_3, rain_date_flag: @event_one_day.rain_date_flag, round_1: @event_one_day.round_1, round_2: @event_one_day.round_2, round_3: @event_one_day.round_3, stadium: @event_one_day.stadium, start_time_1: @event_one_day.start_time_1, start_time_2: @event_one_day.start_time_2, start_time_3: @event_one_day.start_time_3, top_team_1: @event_one_day.top_team_1, top_team_2: @event_one_day.top_team_2, top_team_3: @event_one_day.top_team_3 } }
    end

    assert_redirected_to event_one_day_url(EventOneDay.last)
  end

  test "should show event_one_day" do
    get event_one_day_url(@event_one_day)
    assert_response :success
  end

  test "should get edit" do
    get edit_event_one_day_url(@event_one_day)
    assert_response :success
  end

  test "should update event_one_day" do
    patch event_one_day_url(@event_one_day), params: { event_one_day: { bottom_team_1: @event_one_day.bottom_team_1, bottom_team_2: @event_one_day.bottom_team_2, bottom_team_3: @event_one_day.bottom_team_3, disp_date: @event_one_day.disp_date, event_info_id: @event_one_day.event_info_id, message_1: @event_one_day.message_1, message_2: @event_one_day.message_2, message_3: @event_one_day.message_3, rain_date_flag: @event_one_day.rain_date_flag, round_1: @event_one_day.round_1, round_2: @event_one_day.round_2, round_3: @event_one_day.round_3, stadium: @event_one_day.stadium, start_time_1: @event_one_day.start_time_1, start_time_2: @event_one_day.start_time_2, start_time_3: @event_one_day.start_time_3, top_team_1: @event_one_day.top_team_1, top_team_2: @event_one_day.top_team_2, top_team_3: @event_one_day.top_team_3 } }
    assert_redirected_to event_one_day_url(@event_one_day)
  end

  test "should destroy event_one_day" do
    assert_difference('EventOneDay.count', -1) do
      delete event_one_day_url(@event_one_day)
    end

    assert_redirected_to event_one_days_url
  end
end
