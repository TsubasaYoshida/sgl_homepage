require "application_system_test_case"

class AwardInfosTest < ApplicationSystemTestCase
  setup do
    @award_info = award_infos(:one)
  end

  test "visiting the index" do
    visit award_infos_url
    assert_selector "h1", text: "Award Infos"
  end

  test "creating a Award info" do
    visit award_infos_url
    click_on "New Award Info"

    fill_in "Event", with: @award_info.event
    fill_in "Season", with: @award_info.season
    fill_in "Year", with: @award_info.year
    click_on "Create Award info"

    assert_text "Award info was successfully created"
    click_on "Back"
  end

  test "updating a Award info" do
    visit award_infos_url
    click_on "Edit", match: :first

    fill_in "Event", with: @award_info.event
    fill_in "Season", with: @award_info.season
    fill_in "Year", with: @award_info.year
    click_on "Update Award info"

    assert_text "Award info was successfully updated"
    click_on "Back"
  end

  test "destroying a Award info" do
    visit award_infos_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Award info was successfully destroyed"
  end
end
