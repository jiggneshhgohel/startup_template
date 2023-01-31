# frozen_string_literal: true

module StartupTemplate
  class Settings < Hanami::Settings
    # Define your app settings here, for example:
    #
    # setting :my_flag, default: false, constructor: Types::Params::Bool

    setting :session_secret, constructor: Types::String
    setting :database_url, constructor: Types::String

    # Reference: https://guides.hanamirb.org/v2.0/app/settings/#adding-custom-methods
    def assets_root
      assets_util.assets_root
    end

    def assets_cache_control_setting
      assets_util.assets_cache_control_setting
    end

    private

    def assets_util
      @assets_util ||= AssetsUtil.new
    end
  end
end
