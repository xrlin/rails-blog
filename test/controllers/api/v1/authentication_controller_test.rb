require 'test_helper'

class Api::V1::AuthenticationControllerTest < ActionDispatch::IntegrationTest
  # test "the truth" do
  #   assert true
  # end
  def setup
    admin = Admin.new(email: 'test2@example.com', password: 'password', password_confirmation: 'password')
    admin.save
  end

  test "should return a token" do
    post api_v1_authentication_token_url, params: {email: "test2@example.com", password: 'password'}
    assert_response :accepted
  end

  test "should return AccessDenied" do
    post api_v1_authentication_token_url, params: {email: "test2@example.com", password: 'passwordk'}
    assert_response :unauthorized
  end

  def teardown
    # clear SiteConfig
    SiteConfig.admin_email = nil
  end

end
