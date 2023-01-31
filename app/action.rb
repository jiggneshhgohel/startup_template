# auto_register: false
# frozen_string_literal: true

require "hanami/action"

module StartupTemplate
  class Action < Hanami::Action

    private

    def set_flash_message(response:, key:, message:, is_for_redirect_request: false)
      if !!is_for_redirect_request
        response.flash[key] = message
      else
        response.flash.now[key] = message
      end
    end

    def set_notice_in_flash(response:, message:, is_for_redirect_request: false)
      set_flash_message(response: response, key: :notice, message: message, is_for_redirect_request: is_for_redirect_request)
    end

    def set_success_in_flash(response:, message:, is_for_redirect_request: false)
      set_flash_message(response: response, key: :success, message: message, is_for_redirect_request: is_for_redirect_request)
    end

    def set_error_in_flash(response:, message:, is_for_redirect_request: false)
      set_flash_message(response: response, key: :error, message: message, is_for_redirect_request: is_for_redirect_request)
    end

    def transform_errors_hash_to_error_messages(errors_hash:)
      error_arr = []

      errors_hash.each do |k, arr|
        arr.each do |msg|
          error_arr << "#{k.capitalize} #{msg}"
        end
      end

      error_arr
    end

    def transform_errors_hash_to_error_message(errors_hash:)
      transform_errors_hash_to_error_messages(errors_hash: errors_hash).join(', ')
    end
  end
end
