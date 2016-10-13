module Api
  module V1
    class AuthenticationController < Api::V1::ApplicationController

      def token
        admin = Admin.find(params[:email])
        raise AccessDenied.new('Account validation failed!') if admin.nil? || !admin.authenticate(params[:password])
        render json: { token: admin.token }, status: :accepted
      end

    end
  end
end
