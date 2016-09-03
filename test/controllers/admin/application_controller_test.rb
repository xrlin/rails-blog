require 'test_helper'

class Admin::ApplicationControllerTest < ActionDispatch::IntegrationTest
  # test "the truth" do
  #   assert true
  # end

  test "should redirect_to to new_admin_user" do
    get '/admin'
    assert_response :redirect
    assert_redirected_to new_admin_user_url
  end

  test "should get admin index" do
    SiteConfig.admin_email = 'sfdsf'
    get '/admin'
    assert_response :success
  end

  def teardown
    # clear SiteConfig
    SiteConfig.admin_email = nil
  end

end
