require 'test_helper'

class AdminTest < ActiveSupport::TestCase

  def setup
    SiteConfig.admin_email = nil
  end

  test "email is invalid" do
    admin = Admin.new(email: 'xx', password: 'password', password_confirmation: 'password')
    assert false == admin.valid?, 'Email validator is not work properly'
    assert false == admin.save, 'Email is not valid but can save, this must be fixed!'
    # assert SiteConfig.admin_email == nil
  end

  test "password is invalid" do
    admin = Admin.new(email: 'xx@example.com', password: 'pa', password_confirmation: 'pa')
    assert false == admin.valid?, 'Password validator is not work properly'
    assert false == admin.save, 'Password is not valid but can save, this must be fixed!'
    admin = Admin.new(email: 'xx@example.com', password: 'password', password_confirmation: 'password1')
    assert false == admin.valid?, 'Password validator is not work properly'
    assert false == admin.save, 'Password is not valid but can save, this must be fixed!'
  end

  test "all is valid" do
    admin = Admin.new(email: 'test@example.com', password: 'password', password_confirmation: 'password')
    assert true == admin.valid?, 'all validator is work properly'
    assert true == admin.save, 'all validators pass, but has trobule when saved'
    assert SiteConfig.admin_email == admin.email
  end

  def teardown
    # clear SiteConfig
    SiteConfig.admin_email = nil
  end
end
