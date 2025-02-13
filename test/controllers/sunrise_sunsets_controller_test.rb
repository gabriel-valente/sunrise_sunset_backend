require "test_helper"

class SunriseSunsetsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @sunrise_sunset = sunrise_sunsets(:one)
  end

  test "should get index" do
    get sunrise_sunsets_url
    assert_response :success
  end

  test "should get new" do
    get new_sunrise_sunset_url
    assert_response :success
  end

  test "should create sunrise_sunset" do
    assert_difference("SunriseSunset.count") do
      post sunrise_sunsets_url, params: { sunrise_sunset: { date: @sunrise_sunset.date, golden_hour: @sunrise_sunset.golden_hour, location: @sunrise_sunset.location, sunrise: @sunrise_sunset.sunrise, sunset: @sunrise_sunset.sunset } }
    end

    assert_redirected_to sunrise_sunset_url(SunriseSunset.last)
  end

  test "should show sunrise_sunset" do
    get sunrise_sunset_url(@sunrise_sunset)
    assert_response :success
  end

  test "should get edit" do
    get edit_sunrise_sunset_url(@sunrise_sunset)
    assert_response :success
  end

  test "should update sunrise_sunset" do
    patch sunrise_sunset_url(@sunrise_sunset), params: { sunrise_sunset: { date: @sunrise_sunset.date, golden_hour: @sunrise_sunset.golden_hour, location: @sunrise_sunset.location, sunrise: @sunrise_sunset.sunrise, sunset: @sunrise_sunset.sunset } }
    assert_redirected_to sunrise_sunset_url(@sunrise_sunset)
  end

  test "should destroy sunrise_sunset" do
    assert_difference("SunriseSunset.count", -1) do
      delete sunrise_sunset_url(@sunrise_sunset)
    end

    assert_redirected_to sunrise_sunsets_url
  end
end
