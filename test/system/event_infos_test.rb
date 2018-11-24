require "application_system_test_case"

class EventInfosTest < ApplicationSystemTestCase
  setup do
    @event_info = event_infos(:one)
  end

  test "visiting the index" do
    visit event_infos_url
    assert_selector "h1", text: "Event Infos"
  end

  test "creating a Event info" do
    visit event_infos_url
    click_on "New Event Info"

    fill_in "League", with: @event_info.league
    fill_in "Season", with: @event_info.season
    fill_in "Year", with: @event_info.year
    click_on "Create Event info"

    assert_text "Event info was successfully created"
    click_on "Back"
  end

  test "updating a Event info" do
    visit event_infos_url
    click_on "Edit", match: :first

    fill_in "League", with: @event_info.league
    fill_in "Season", with: @event_info.season
    fill_in "Year", with: @event_info.year
    click_on "Update Event info"

    assert_text "Event info was successfully updated"
    click_on "Back"
  end

  test "destroying a Event info" do
    visit event_infos_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Event info was successfully destroyed"
  end
end
