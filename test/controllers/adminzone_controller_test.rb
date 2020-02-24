require 'test_helper'

class AdminzoneControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get adminzone_index_url
    assert_response :success
  end

end
