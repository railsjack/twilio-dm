require 'test_helper'

class IndustriesControllerTest < ActionDispatch::IntegrationTest
  test "should get healthcare" do
    get industries_healthcare_url
    assert_response :success
  end

  test "should get retail" do
    get industries_retail_url
    assert_response :success
  end

  test "should get digital" do
    get industries_digital_url
    assert_response :success
  end

  test "should get logistics" do
    get industries_logistics_url
    assert_response :success
  end

  test "should get travel" do
    get industries_travel_url
    assert_response :success
  end

  test "should get media" do
    get industries_media_url
    assert_response :success
  end

end
