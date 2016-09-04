class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  before_action :has_admin?

  def index

  end

  protected
    def has_admin?
      # check if a admin user has set for this application
      redirect_to new_admin_user_path unless SiteConfig.admin_email
    end

end
