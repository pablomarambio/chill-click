require 'test_helper'

class ProspectControllerTest < ActionController::TestCase
  test "should get assign_event" do
    get :assign_event
    assert_response :success
  end

end
