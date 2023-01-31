# frozen_string_literal: true

require "hanami"

require_relative "../lib/startup_template/log_util"

module StartupTemplate
  class App < Hanami::App
    SESSION_KEY = 'startup_template.session'

    # value corresponds to number of seconds in 1 year.
    SESSION_EXPIRY_TIME_IN_SECONDS = 60*60*24*365

    # ======== STARTS: ROUTER CONFIG

    config.middleware.use Rack::MethodOverride

    # ======== ENDS: ROUTER CONFIG

    # ======== STARTS: ACTIONS CONFIG

    config.actions.content_security_policy[:default_src] = "'self'"

    config.actions.sessions = :cookie, {
      key: SESSION_KEY,
      secret: settings.session_secret,
      expire_after: SESSION_EXPIRY_TIME_IN_SECONDS
    }

    # ======== ENDS: ACTIONS CONFIG

    # ======== STARTS: LOGGER CONFIG

    config.logger.formatter = :json
    config.logger.stream = root.join("log").join("#{Hanami.env}.log")

    environment(:production) do
      config.logger.level = LogUtil.production_log_level
    end

    # ======== ENDS: LOGGER CONFIG
  end
end
