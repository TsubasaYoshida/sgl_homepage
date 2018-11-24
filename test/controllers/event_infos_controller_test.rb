require 'test_helper'

class EventInfosControllerTest < ActionDispatch::IntegrationTest
  setup do
    @event_info = event_infos(:one)
  end

  test "should get index" do
    get event_infos_url
    assert_response :success
  end

  test "should get new" do
    get new_event_info_url
    assert_response :success
  end

  test "should create event_info" do
    assert_difference('EventInfo.count') do
      post event_infos_url, params: { event_info: { league: @event_info.league, season: @event_info.season, year: @event_info.year } }
    end

    assert_redirected_to event_info_url(EventInfo.last)
  end

  test "should show event_info" do
    get event_info_url(@event_info)
    assert_response :success
  end

  test "should get edit" do
    get edit_event_info_url(@event_info)
    assert_response :success
  end

  test "should update event_info" do
    patch event_info_url(@event_info), params: { event_info: { league: @event_info.league, season: @event_info.season, year: @event_info.year } }
    assert_redirected_to event_info_url(@event_info)
  end

  test "should destroy event_info" do
    assert_difference('EventInfo.count', -1) do
      delete event_info_url(@event_info)
    end

    assert_redirected_to event_infos_url
  end
end
