require 'test_helper'

class CaseStudiesControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get case_studies_index_url
    assert_response :success
  end

end
