require 'test_helper'

class GmapsControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get gmaps_index_url
    assert_response :success
  end

end
