require 'test_helper'

class CategoriesControllerTest < ActionDispatch::IntegrationTest
  test "should get category and its posts" do
    category = Category.create(name: 'Test')
    get category_url(category)
    assert_response :success
  end
end
