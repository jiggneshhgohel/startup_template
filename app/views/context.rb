# frozen_string_literal: true

require 'hanami/view/context'

module StartupTemplate
  module Views
    class Context < Hanami::View::Context
      def initialize(**options)
        @options = options
        super(**options)
      end

    end
  end
end
