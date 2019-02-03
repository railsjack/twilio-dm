require 'test_helper'

class TwiliosControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get twilios_index_url
    assert_response :success
  end

  test "should get show" do
    get twilios_show_url
    assert_response :success
  end

  test "should get new" do
    get twilios_new_url
    assert_response :success
  end

  test "should get edit" do
    get twilios_edit_url
    assert_response :success
  end

end
