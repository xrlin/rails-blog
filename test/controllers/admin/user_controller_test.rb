require 'test_helper'

class Admin::UserControllerTest < ActionDispatch::IntegrationTest
  # test "the truth" do
  #   assert true
  # end
  test "should create a new admin" do
    post admin_user_index_url, params: { email: 'test@example.com',  password: 'password', password_confirmation: 'password' }
    assert SiteConfig.admin_email == 'test@example.com', 'Create new admin failed!'
    assert_redirected_to admin_root_path
  end

  test "should not create a invalid admin" do
    # email is invalid
    post admin_user_index_url, params: { email: 'test',  password: 'password', password_confirmation: 'password' }
    assert_response :bad_request
    assert_equal SiteConfig.admin_email, nil

    # password is invalid
    post admin_user_index_url, params: { email: 'test',  password: 'pa', password_confirmation: 'pa' }
    assert_response :bad_request
    assert_equal SiteConfig.admin_email, nil

    # password_confirmation is invalid
    post admin_user_index_url, params: { email: 'test',  password: 'password', password_confirmation: '' }
    assert_response :bad_request
    assert_equal SiteConfig.admin_email, nil
  end

  def teardown
    SiteConfig.admin_email = nil
  end
end
