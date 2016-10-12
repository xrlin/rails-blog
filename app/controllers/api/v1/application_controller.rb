module Api
  module V1
    class ApplicationController < ActionController::API

      class AccessDenied < StandardError; end
      class PageNotFound < StandardError; end

      rescue_from(AccessDenied) do |err|
        render json: { error: 'AccessDenied', message: err }, status: :unauthorized
      end

      rescue_from(ActiveRecord::RecordNotFound) do
        render json: { error: 'ResourceNotFound' }, status: :not_found
      end

      rescue_from(ActiveRecord::RecordInvalid) do |err|
        render json: { error: 'RecordInvalid', message: err }, status: :bad_request
      end

      rescue_from(ActionController::ParameterMissing) do |err|
        render json: { error: 'ParameterInvalid', message: err }, status: :bad_request
      end


      def current_admin
        @current_admin ||= Admin.find_by_token(request.headers[:AUTHORIZATION])
      end

      def authenticate_admin!
        raise AccessDenied unless current_admin
      end

      alias_method :check_token, :authenticate_admin!

    end
  end
end
