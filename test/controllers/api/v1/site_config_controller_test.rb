require 'test_helper'

class Api::V1::SiteConfigsControllerTest < ActionDispatch::IntegrationTest

  def setup
    @admin = Admin.new(email: 'test@example.com', password: 'password', password_confirmation: 'password')
    @admin.save
  end

  test "shoult get configurations" do
    get api_v1_siteConfig_url, headers: { AUTHORIZATION: @admin.token }
    assert_response :ok
  end

  test "set configurations" do
    put api_v1_siteConfig_url, params: { siteConfig: [ {name: 'admin_email', value: 'test@email.com' } ] }, headers: { AUTHORIZATION: @admin.token }
    assert SiteConfig.admin_email == 'test@email.com'
    assert_response :ok
  end

  def teardown
    # clear SiteConfig
    SiteConfig.admin_email = nil
  end

end
