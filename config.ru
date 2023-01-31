# frozen_string_literal: true

require "hanami/boot"

settings_obj = Hanami.app['settings']

assets_root = settings_obj.assets_root
assets_cache_control_setting = settings_obj.assets_cache_control_setting

# Reference: https://github.com/rack/rack/blob/2.2.4/lib/rack/static.rb
use Rack::Static, urls: ["/css", "/js" ], root: assets_root,
    :header_rules => [
      # Cache files ending in .css or .js in public caches (e.g. Rack::Cache)
      # as well as in the browser. For e.g. myfile.css

      [ %w(css js), assets_cache_control_setting ]
    ]

run Hanami.app
