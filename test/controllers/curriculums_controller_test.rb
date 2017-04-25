require 'test_helper'

class CurriculumsControllerTest < ActionDispatch::IntegrationTest
  test "should get new" do
    get curriculums_new_url
    assert_response :success
  end

end
