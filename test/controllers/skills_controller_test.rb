require 'test_helper'

class SkillsControllerTest < ActionDispatch::IntegrationTest
  test "should get laravel" do
    get skills_laravel_url
    assert_response :success
  end

  test "should get codeigniter" do
    get skills_codeigniter_url
    assert_response :success
  end

  test "should get ror" do
    get skills_ror_url
    assert_response :success
  end

  test "should get reactnative" do
    get skills_reactnative_url
    assert_response :success
  end

  test "should get reactjs" do
    get skills_reactjs_url
    assert_response :success
  end

  test "should get vuejs" do
    get skills_vuejs_url
    assert_response :success
  end

  test "should get android" do
    get skills_android_url
    assert_response :success
  end

  test "should get nodejs" do
    get skills_nodejs_url
    assert_response :success
  end

  test "should get ios" do
    get skills_ios_url
    assert_response :success
  end

  test "should get angularjs" do
    get skills_angularjs_url
    assert_response :success
  end

end
