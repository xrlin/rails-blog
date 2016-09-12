module Api
  module V1
    class AuthenticationController < Api::V1::ApplicationController

      def token
        admin = Admin.find(params[:email])
        raise AccessDenied if admin.nil? || !admin.authenticate(params[:password])
        render json: admin.token, status: :accepted
      end

    end
  end
end
