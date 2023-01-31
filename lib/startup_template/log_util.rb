# auto_register: false
# frozen_string_literal: true

module StartupTemplate
  module LogUtil
    extend self

    LOGGER_METHODS = [
      :debug,
      :info,
      :warn,
      :error,
      :fatal
    ].freeze

    PRODUCTION_ENV_DEFAULT_LOG_LEVEL = :info

    LOGGER_METHODS.each do |method_name|
      # def debug(msg, payload=nil)
      #  ...
      #  ...
      # end
      define_method(method_name) do |msg, payload=nil|
        should_pass_payload = payload.is_a?(Hash)

        logger_instance = Hanami.app['logger']

        if should_pass_payload
          logger_instance.send(method_name, msg, **payload)
        else
          logger_instance.send(method_name, msg)
        end
      end
    end

    def is_given_log_level_valid?(log_level:)
      return false if log_level.nil?

      LOGGER_METHODS.include?(log_level.to_sym)
    end

    def production_log_level
      use_as_default_log_level = PRODUCTION_ENV_DEFAULT_LOG_LEVEL

      return use_as_default_log_level unless Hanami.env?(:production)

      log_level = ENV['USE_AS_LOG_LEVEL']

      unless is_given_log_level_valid?(log_level: log_level)
        return use_as_default_log_level
      end

      log_level.to_sym
    end
  end
end
