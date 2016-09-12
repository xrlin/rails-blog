module Api
  module V1
    class ApplicationController < ActionController::API

      class AccessDenied < StandardError; end
      class PageNotFound < StandardError; end

      rescue_from(AccessDenied) do |err|
        render json: { error: 'AccessDenied', message: err }, status: :unauthorized
      end


      def current_admin
        @current_admin ||= Admin.find_by_token(request.headers[:AUTHORIZATION])
      end

      def authenticate_admin!
        raise AccessDenied unless current_admin
      end
    end
  end
end
