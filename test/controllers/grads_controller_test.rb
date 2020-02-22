require 'test_helper'

class GradsControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get grads_index_url
    assert_response :success
  end

end
