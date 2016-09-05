require 'test_helper'

class Admin::PostsControllerTest < ActionDispatch::IntegrationTest
  def setup
    # set the admin user to avoid redirect
    SiteConfig.admin_email = 'test@example.com'
  end
  test "should post create" do
    post admin_posts_url, params: {title: 'Test', body: 'Hello world'}
    assert_response :created
  end

end
