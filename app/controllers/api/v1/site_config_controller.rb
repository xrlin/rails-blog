module Api
  module V1
    class SiteConfigController < Api::V1::ApplicationController

      def index
        # TODO Paginate posts
        render json: SiteConfig.get_all, status: :ok
      end

      def update
        site_params.each do |set_hash|
          setting = get_setting(set_hash[:name])
          if setting.value != set_hash[:value]
            setting.value = set_hash[:value]
            setting.save
            setting.expire_cache
          end
        end
        head :ok
      end

      private
        def site_params
          params.require(:siteConfig)
        end

        def get_setting(var_name)
          SiteConfig.find_by(var: var_name) || SiteConfig.new(var: params[:id])
        end

    end
  end
end
