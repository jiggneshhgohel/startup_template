# auto_register: false
# frozen_string_literal: true

module StartupTemplate
  module StringUtil
    extend self

    EMPTY_STRING = ''

    def blank?(str:)
      return true if str.nil?

      strip(str: str).empty?
    end

    def present?(str:)
      !blank?(str: str)
    end

    def strip(str:)
      return EMPTY_STRING if str.nil?

      str.strip
    end

  end
end
