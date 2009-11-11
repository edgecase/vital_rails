require 'test_helper'

class SongsControllerTest < ActionController::TestCase
  # Replace this with your real tests.
  test "the truth" do
    assert true
  end

  test "index" do
    get :index

    assert_response :success
    assert_template :index
    assert assigns(:songs)
    assert_equal [], assigns(:songs)
  end
end
