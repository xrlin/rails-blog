class Admin::UserController < Admin::ApplicationController
  skip_before_action :has_admin?, only: [:new, :create]

  def new
    head :ok
  end

  def create
    admin = Admin.new(admin_params)
    admin.save ? redirect_to(admin_root_url) : head(:bad_request)
  end

  private
    def admin_params
      params.permit(:email, :password, :password_confirmation)
    end
end
