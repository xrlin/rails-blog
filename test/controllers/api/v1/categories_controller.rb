require 'test_helper'

class Api::V1::CategoriesControllerTest < ActionDispatch::IntegrationTest

  def setup
    @admin = Admin.new(email: 'test@example.com', password: 'password', password_confirmation: 'password')
    @admin.save
  end

  test "should return forbidden" do
    post api_v1_categories_url
    assert_response :unauthorized
    post api_v1_categories_url, headers: { AUTHORIZATION: 'sdfsdfsdfsdf239482397429834' }
    assert_response :unauthorized
  end

  test "should create and return json" do
    assert_difference 'Category.count', 1 do
      post api_v1_categories_url, params: { categories: [{ name: 'test1' }] }, headers: { AUTHORIZATION: @admin.token }
      assert_response :success
    end
  end

  def teardown
    # clear SiteConfig
    SiteConfig.admin_email = nil
  end

end
