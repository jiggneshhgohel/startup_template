# auto_register: false
# frozen_string_literal: true

# This file is intended to be included in `StartupTemplate::View::CommonHelpers` where
# `Hanami::Helpers` are included because few methods in this file utilizes the helpers
# facilitated by `Hanami::Helpers`.
module StartupTemplate
  module View
    module AssetsHelpers
      private

      STYLESHEET_STRING = 'stylesheet'

      def _join_given_tag_strings(str_arr:)
        str_arr.join("\n")
      end

      def _construct_stylesheet_link_tags_string(stylesheet_file_paths)
        link_tag_arr =
          stylesheet_file_paths.map do |file_path|
            html.link(href: file_path, rel: STYLESHEET_STRING)
          end

        _join_given_tag_strings(str_arr: link_tag_arr)
      end

      def _construct_script_tags_string(js_file_paths)
        script_tag_arr =
          js_file_paths.map do |file_path|
            html.script(src: file_path)
          end

        _join_given_tag_strings(str_arr: script_tag_arr)
      end

      def assets_util
        @assets_util ||= ::StartupTemplate::AssetsUtil.new
      end

      def layout_stylesheet_link_tags_string
        css_file_paths = assets_util.css_file_paths_for_including_in_view_layout

        _construct_stylesheet_link_tags_string(css_file_paths)
      end

      def layout_script_tags_string
        js_file_paths = assets_util.js_file_paths_for_including_in_view_layout

        _construct_script_tags_string(js_file_paths)
      end

    end
  end
end
