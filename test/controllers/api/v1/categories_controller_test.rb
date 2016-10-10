require 'test_helper'

class Api::V1::CategoriesControllerTest < ActionDispatch::IntegrationTest

  def setup
    @admin = Admin.new(email: 'test@example.com', password: 'password', password_confirmation: 'password')
    @admin.save
  end

  test "shoult get categories" do
    get api_v1_categories_url
    assert_response :ok
  end

  test "should return forbidden" do
    post api_v1_categories_url
    assert_response :unauthorized
    post api_v1_categories_url, headers: { AUTHORIZATION: 'sdfsdfsdfsdf239482397429834' }
    assert_response :unauthorized
  end

  test "should create" do
    assert_difference 'Category.count', 1 do
      post api_v1_categories_url, params: { category: { name: 'test1' } }, headers: { AUTHORIZATION: @admin.token }
      assert_response :created
    end
  end

  test "should create invalid" do
    post api_v1_categories_url, params: { category: { name: '' } }, headers: { AUTHORIZATION: @admin.token }
    assert_response :bad_request
    post api_v1_categories_url, params: { category: {  } }, headers: { AUTHORIZATION: @admin.token }
    assert_response :bad_request
    post api_v1_categories_url, params: {  }, headers: { AUTHORIZATION: @admin.token }
    assert_response :bad_request
  end

  test "should update" do
    patch api_v1_category_url(categories(:test)), params: { category: {name: 'test2'} }, headers: { AUTHORIZATION: @admin.token }
    assert_response :ok
  end

  test "should update invalid" do
    patch api_v1_category_url(categories(:test)), params: { category: {name: '' } }, headers: { AUTHORIZATION: @admin.token }
    assert_response :bad_request
    patch api_v1_category_url(categories(:test)), params: { category: {} }, headers: { AUTHORIZATION: @admin.token }
    assert_response :bad_request
    patch api_v1_category_url(categories(:test)), params: {  }, headers: { AUTHORIZATION: @admin.token }
    assert_response :bad_request
  end

  test "should destroy" do
    assert_difference 'Category.count', -1 do
      delete api_v1_category_url(categories(:test)), params: { category: { id: categories(:test).id } }, headers: { AUTHORIZATION: @admin.token }
      assert_response :ok
    end
  end

  def teardown
    # clear SiteConfig
    SiteConfig.admin_email = nil
  end

end
