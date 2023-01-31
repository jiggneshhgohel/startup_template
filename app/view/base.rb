# auto_register: false
# frozen_string_literal: true

require 'hanami/view'

module StartupTemplate
  module View
    class Base < Hanami::View
      config.paths = Hanami.app.root.join("app/templates")
      config.layout = "application"

      config.renderer_options = { escape_html: false }

      expose :params
      expose :flash, layout: true

      attr_reader :view_context

      def call(**options)
        @view_context = options[:context]
        super
      end

      def csrf_token
        view_context.csrf_token
      end

      private

      def request
        view_context.request
      end

      def session
        view_context.session
      end

      def flash
        view_context.flash
      end

      def params
        request.params
      end

    end
  end
end
