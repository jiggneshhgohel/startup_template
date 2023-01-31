# auto_register: false
# frozen_string_literal: true

require 'hanami/helpers'

module StartupTemplate
  module View
    module CommonHelpers
      include Hanami::Helpers

      include ::StartupTemplate::View::AssetsHelpers

      EMPTY_HASH = {}.freeze
      EMPTY_STRING = ""

      TIMESTAMP_FORMAT_1 = '%b %d, %Y %I:%M:%S %p %z' # Jan 27, 2023 06:27:35 PM +0530

      private

      # ======= STARTS: STRING HELPERS

      def blank?(str:)
        ::StartupTemplate::StringUtil.blank?(str: str)
      end

      def present?(str:)
        ::StartupTemplate::StringUtil.present?(str: str)
      end

      def strip(str:)
        ::StartupTemplate::StringUtil.strip(str: str)
      end

      def strip_param_value(value)
        strip(str: value)
      end

      # ======= ENDS: STRING HELPERS

      def format_timestamp(timestamp:, format: nil)
        format ||= TIMESTAMP_FORMAT_1
        timestamp.strftime(format)
      end

      def app_route_path(route_name_sym:, **route_args)
        Hanami.app["routes"].path(route_name_sym, route_args)
      end

      def construct_link_path(route_opts:)
        route_name = route_opts[:name]
        route_args = route_opts[:args] || EMPTY_HASH

        app_route_path(route_name_sym: route_name, **route_args)
      end

      def link(route_opts:, link_name: nil, opts: nil, &block)
        opts ||= {}

        link_path = construct_link_path(route_opts: route_opts)

        if block_given?
          link_to( link_path, class: opts[:css_classes] ) do
            block.call
          end

        else
          link_to( link_name, link_path, class: opts[:css_classes] )
        end
      end

      def button_link(button_name:, route_opts:, opts: nil)
        link(route_opts: route_opts, opts: opts) do
          html.button(button_name)
        end
      end

      def button(button_name:, opts: nil)
        opts ||= {}

        css_classes = opts[:css_classes]
        data_attrs = opts[:data_attrs]

        button_attrs = {
          class: css_classes
        }

        button_attrs.merge!(data_attrs)

        html.button(button_name, button_attrs)
      end

      def home_page_link
        route_opts = {
          name: :root
        }

        opts = {
          css_classes: 'home-page'
        }

        link(route_opts: route_opts, link_name: 'Home', opts: opts)
      end

      def doctors_page_link
        route_opts = {
          name: :doctors_doctors
        }

        opts = {
          css_classes: 'doctors-listing'
        }

        link(route_opts: route_opts, link_name: 'Manage Doctors', opts: opts)
      end

    end
  end
end
