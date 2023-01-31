# auto_register: false
# frozen_string_literal: true

module StartupTemplate
  class AssetsUtil

    PRODUCTION_ASSET_FINGERPRINT_FILE_NAME = '.production_asset_fingerprint'

    PRODUCTION_ASSET_CACHE_TIME_LIMIT_IN_SECONDS = begin
      use_as_seconds = ENV['PRODUCTION_ASSET_CACHE_TIME_LIMIT_IN_SECONDS'].to_i

      if use_as_seconds > 0
        use_as_seconds
      else
        # default number of seconds in 1 year.
        31536000
      end
    end

    class << self
      def application_root
        Hanami.app.root
      end

      def generate_fingerprint_for_production_asset
        fingerprint_value = Time.now.utc.to_i

        # Read-Write permission with contents overwritten
        file_mode = 'w+'

        FilesUtil
          .create_file(
            file_path: production_asset_fingerprint_file_absolute_path,
            contents: fingerprint_value,
            mode: file_mode)
      end

      def production_asset_current_finger_print
        StartupTemplate::FilesUtil.read_file(file_path: production_asset_fingerprint_file_absolute_path)
      end

      private

      def production_asset_fingerprint_file_absolute_path
        application_root.join(PRODUCTION_ASSET_FINGERPRINT_FILE_NAME)
      end
    end

    # Should be a relative path to app's root folder
    ASSETS_ROOT_DEVELOPMENT = 'app/assets'
    ASSETS_ROOT_PRODUCTION = 'public'

    # Should be a relative path to asset's root folder
    CSS_ASSET_DIR = 'css'
    JS_ASSET_DIR = 'js'

    attr_reader :env_name

    def initialize
      @env_name = Hanami.env
    end

    def is_production_env?
      @is_production_env ||= ( env_name == :production )
    end

    def application_root
      @application_root ||= self.class.application_root
    end

    def assets_root
      @assets_root ||= begin
        return ASSETS_ROOT_PRODUCTION if is_production_env?

        ASSETS_ROOT_DEVELOPMENT
      end
    end

    def assets_cache_control_setting
      # Refer details under NOTE-1 in the HERE doc at the bottom of this
      # file regarding the strategy we have defined for serving assets
      # for `production` and `development` envs.

      if is_production_env?
        cache_time_limit = PRODUCTION_ASSET_CACHE_TIME_LIMIT_IN_SECONDS
        cache_control_header_value = "public, max-age=#{cache_time_limit}"

      else
        cache_control_header_value = 'no-cache'
      end

      # For the values for this header following referenced are used:
      #   https://csswizardry.com/2019/03/cache-control-for-civilians/
      #   https://css-tricks.com/strategies-for-cache-busting-css

      { 'Cache-Control' => cache_control_header_value }
    end

    def css_source_file_absolute_paths
      asset_source_file_absolute_paths(css_source_file_relative_paths)
    end

    def js_source_file_absolute_paths
      asset_source_file_absolute_paths(js_source_file_relative_paths)
    end

    def css_file_paths_for_including_in_view_layout
      fp_arr = []

      if is_production_env?
        fp_arr = [ production_env_css_file_relative_path ]

      else
        fp_arr = css_source_file_relative_paths
      end

      fp_arr.map { |fp| asset_file_path_for_including_in_view_layout(fp) }
    end

    def js_file_paths_for_including_in_view_layout
      fp_arr = []

      if is_production_env?
        fp_arr = [ production_env_js_file_relative_path ]

      else
        fp_arr = js_source_file_relative_paths
      end

      fp_arr.map { |fp| asset_file_path_for_including_in_view_layout(fp) }
    end

    def production_env_css_file_absolute_path
      production_env_asset_file_absolute_path(production_env_css_file_relative_path)
    end

    def production_env_js_file_absolute_path
      production_env_asset_file_absolute_path(production_env_js_file_relative_path)
    end

    private

    # ======== STARTS: PRODUCTION ASSETS RELATED

    def production_env_asset_file_name
      @production_env_asset_file_name ||= "application"
    end

    def css_file_extension
      @css_file_extension ||= '.css'
    end

    def js_file_extension
      @js_file_extension ||= '.js'
    end

    def production_env_asset_file_name_including_fingerprint
      @production_env_asset_file_name_including_fingerprint ||= "#{production_env_asset_file_name}.#{self.class.production_asset_current_finger_print}"
    end

    def production_env_css_file_name
      "#{production_env_asset_file_name_including_fingerprint}#{css_file_extension}"
    end

    def production_env_js_file_name
      "#{production_env_asset_file_name_including_fingerprint}#{js_file_extension}"
    end

    def production_env_css_file_relative_path
      @production_env_css_file_relative_path ||=
        asset_relative_file_path(
          asset_dir: css_asset_dir,
          asset_file_name: production_env_css_file_name)
    end

    def production_env_js_file_relative_path
      @production_env_js_file_relative_path ||=
        asset_relative_file_path(
          asset_dir: js_asset_dir,
          asset_file_name: production_env_js_file_name)
    end

    def production_env_asset_file_absolute_path(asset_file_relative_path)
      asset_file_absolute_path(asset_relative_filepath: asset_file_relative_path, use_as_assets_root: ASSETS_ROOT_PRODUCTION)
    end

    # ======== ENDS: PRODUCTION ASSETS RELATED

    def read_entries_from_manifest_for_given_asset_type(asset_type:)
      manifest_file_path = application_root.join("app/assets/#{asset_type}/manifest.txt")

      entries = []

      File.readlines(manifest_file_path, chomp: true).each do |line|
        next if line.empty?

        entries << line
      end

      entries
    end

    def css_manifest_entries
      read_entries_from_manifest_for_given_asset_type(asset_type: :css)
    end

    def js_manifest_entries
      read_entries_from_manifest_for_given_asset_type(asset_type: :js)
    end

    def asset_file_absolute_path(asset_relative_filepath:, use_as_assets_root: nil)
      unless !!use_as_assets_root
        use_as_assets_root = assets_root
      end

      application_root.join(use_as_assets_root).join(asset_relative_filepath).to_s
    end

    def asset_file_path_for_including_in_view_layout(asset_relative_filepath)
      "/#{asset_relative_filepath}"
    end

    def asset_relative_file_path(asset_dir:, asset_file_name:)
      "#{asset_dir}/#{asset_file_name}"
    end

    def asset_relative_file_paths(asset_manifest_entries:, asset_dir:)
      asset_manifest_entries.map do |asset_file_name|
        asset_relative_file_path(asset_dir: asset_dir, asset_file_name: asset_file_name)
      end
    end

    def asset_file_absolute_paths(asset_relative_file_paths:)
      asset_relative_file_paths.map { |fp| asset_file_absolute_path(asset_relative_filepath: fp) }
    end

    def css_asset_dir
      @css_asset_dir ||= CSS_ASSET_DIR
    end

    def js_asset_dir
      @js_asset_dir ||= JS_ASSET_DIR
    end

    def css_source_file_relative_paths
      @css_source_file_relative_paths ||=
        asset_relative_file_paths(
          asset_manifest_entries: css_manifest_entries,
          asset_dir: css_asset_dir
        )
    end

    def js_source_file_relative_paths
      @js_source_file_relative_paths ||=
        asset_relative_file_paths(
          asset_manifest_entries: js_manifest_entries,
          asset_dir: js_asset_dir
        )
    end

    def asset_source_file_absolute_paths(asset_file_relative_paths)
      asset_file_relative_paths.map do |fp|
        asset_file_absolute_path(asset_relative_filepath: fp, use_as_assets_root: ASSETS_ROOT_DEVELOPMENT)
      end
    end
  end
end

=begin
  NOTE-1:
    The strategy we use for assets serving and caching is explained below:

    For production env:
      We include only two assets application.css and application.js which
      should be served from `public` folder.

      They should be compressed version of all CSS and JS, respectively,
      in the application.

      They should be instructed to be cached for a pre-defined interval.

      They should be included with a fingerprint in their files name.

      If any changes are made to the assets and they are regenerated
      then a new fingerprint should be generated for those assets and
      the views layout should take into account the regenerated fingerprint.

      Example:
        Lets' say we first time generated the asset with a fingerprint 123456
        and set its Cache-control header's max-age value to 1 year.
        The view layout should include the asset with that fingerprint.
        Now on first request to a page the browser should load that asset
        from server and cache it and then for subsequent requests browser
        will use it from its cache.

        Now let's say it has been 3 months since we deployed that asset
        to production and now we need some changes in the asset.
        So we modify the asset and regenerate the asset with a new
        fingerprint say 789123. Now in the view layout we should update
        the asset inclusion to be the one with fingerprint. Now if
        the request to a page is made the browser not finding the updated
        asset requested to be in its cache it should load that asset
        from server and cache it and then for subsequent requests browser
        will use it from its cache.

        So this way cache-busting should happen.


    For development env:
      We individually include each CSS and JS file from our `app/assets`
      folder.

      They should be instructed to always enquire with the server whether
      any modifications are made. If yes then instead of using the cached
      version use the version on server. Refer the specifications for
      `no-cache` value for `Cache-Control` header to know more about this
      strategy.
=end
