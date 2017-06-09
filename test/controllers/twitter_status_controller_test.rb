require 'test_helper'

class TwitterStatusControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get twitter_status_index_url
    assert_response :success
  end

  test "should get getstatus" do
    get twitter_status_getstatus_url
    assert_response :success
  end

end
