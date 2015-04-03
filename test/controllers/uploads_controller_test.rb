require 'test_helper'

class UploadsControllerTest < ActionController::TestCase
  test "should get image" do
    get :image
    assert_response :success
  end

  test "should get photo" do
    get :photo
    assert_response :success
  end

end
