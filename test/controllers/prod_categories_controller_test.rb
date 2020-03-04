require 'test_helper'

class ProdCategoriesControllerTest < ActionDispatch::IntegrationTest
  test "should get new" do
    get prod_categories_new_url
    assert_response :success
  end

end
