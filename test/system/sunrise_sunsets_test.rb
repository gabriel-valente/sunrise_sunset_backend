require "application_system_test_case"

class SunriseSunsetsTest < ApplicationSystemTestCase
  setup do
    @sunrise_sunset = sunrise_sunsets(:one)
  end

  test "visiting the index" do
    visit sunrise_sunsets_url
    assert_selector "h1", text: "Sunrise sunsets"
  end

  test "should create sunrise sunset" do
    visit sunrise_sunsets_url
    click_on "New sunrise sunset"

    fill_in "Date", with: @sunrise_sunset.date
    fill_in "Golden hour", with: @sunrise_sunset.golden_hour
    fill_in "Location", with: @sunrise_sunset.location
    fill_in "Sunrise", with: @sunrise_sunset.sunrise
    fill_in "Sunset", with: @sunrise_sunset.sunset
    click_on "Create Sunrise sunset"

    assert_text "Sunrise sunset was successfully created"
    click_on "Back"
  end

  test "should update Sunrise sunset" do
    visit sunrise_sunset_url(@sunrise_sunset)
    click_on "Edit this sunrise sunset", match: :first

    fill_in "Date", with: @sunrise_sunset.date
    fill_in "Golden hour", with: @sunrise_sunset.golden_hour
    fill_in "Location", with: @sunrise_sunset.location
    fill_in "Sunrise", with: @sunrise_sunset.sunrise
    fill_in "Sunset", with: @sunrise_sunset.sunset
    click_on "Update Sunrise sunset"

    assert_text "Sunrise sunset was successfully updated"
    click_on "Back"
  end

  test "should destroy Sunrise sunset" do
    visit sunrise_sunset_url(@sunrise_sunset)
    click_on "Destroy this sunrise sunset", match: :first

    assert_text "Sunrise sunset was successfully destroyed"
  end
end
