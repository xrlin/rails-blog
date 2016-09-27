require 'test_helper'

class Api::V1::PostsControllerTest < ActionDispatch::IntegrationTest

  def setup
    @admin = Admin.new(email: 'test@example.com', password: 'password', password_confirmation: 'password')
    @admin.save
  end

  test "should get posts" do
    get api_v1_posts_url
    assert_response :ok
  end

  test "should get post by id" do
    get api_v1_post_url(1)
    assert_response :ok
  end

  test "should return forbidden" do
    post api_v1_posts_url
    assert_response :unauthorized
    post api_v1_posts_url, headers: { AUTHORIZATION: 'sdfsdfsdfsdf239482397429834' }
    assert_response :unauthorized
  end

  test "should create" do
    assert_difference 'Post.count', 1 do
      post api_v1_posts_url, params: { post: { title: 'test1', body: 'test body', category_id: 1, tag_list: [:test1, :test2, :test3] } }, headers: { AUTHORIZATION: @admin.token }
      assert_response :ok
    end
  end

  test "should create invalid" do
    post api_v1_posts_url, params: { post: { title: '', body: '' } }, headers: { AUTHORIZATION: @admin.token }
    assert_response :bad_request
  end

  test "should update" do
    patch api_v1_post_url(posts(:test)), params: { post: {name: 'test2'} }, headers: { AUTHORIZATION: @admin.token }
    assert_response :ok
  end

  test "should update invalid" do
    patch api_v1_post_url(posts(:test)), params: { category: {name: ''} }, headers: { AUTHORIZATION: @admin.token }
    assert_response :bad_request
  end

  test "should destroy one" do
    assert_difference 'Post.count', -1 do
      delete api_v1_post_url(posts(:test)), headers: { AUTHORIZATION: @admin.token }
      assert_response :ok
    end
  end

  def teardown
    # clear SiteConfig
    SiteConfig.admin_email = nil
  end

end
