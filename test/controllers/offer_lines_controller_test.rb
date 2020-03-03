require 'test_helper'

class OfferLinesControllerTest < ActionDispatch::IntegrationTest
  test "should get new" do
    get offer_lines_new_url
    assert_response :success
  end

  test "should get index" do
    get offer_lines_index_url
    assert_response :success
  end

end
