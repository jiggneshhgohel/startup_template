# frozen_string_literal: true

require "hanami/rake_tasks"
require 'rom/sql/rake_task'

task :environment do
  require_relative "config/app"
  require "hanami/prepare"
end

namespace :db do
  task setup: :environment do
    Hanami.app.prepare(:persistence)
    ROM::SQL::RakeSupport.env = Hanami.app["persistence.config"]
  end
end

namespace :assets_custom_manager do
  desc 'Minify Assets using custom strategy'

  def asset_type_css
    'css'
  end

  def asset_type_js
    'js'
  end

  # helper methods
  def minify_asset_file_contents(asset_type:, asset_file_absolute_path:)
    file_contents = StartupTemplate::FilesUtil.read_file(file_path: asset_file_absolute_path)

    file_contents_minified = nil

    if asset_type == asset_type_css
      file_contents_minified = CSSminify2.compress(file_contents)

    elsif asset_type == asset_type_js
      file_contents_minified = Terser.compile(file_contents)
    end

    file_contents_minified
  end

  def minify_assets(asset_type:)
    assets_util = StartupTemplate::AssetsUtil.new

    asset_source_file_absolute_paths = []
    minified_asset_file_absolute_path = nil
    minified_asset_file_extension = nil

    if asset_type == asset_type_css
      asset_source_file_absolute_paths = assets_util.css_source_file_absolute_paths
      minified_asset_file_absolute_path = assets_util.production_env_css_file_absolute_path
      minified_asset_file_extension = asset_type_css

    elsif asset_type == asset_type_js
      asset_source_file_absolute_paths = assets_util.js_source_file_absolute_paths
      minified_asset_file_absolute_path = assets_util.production_env_js_file_absolute_path
      minified_asset_file_extension = asset_type_js
    end

    if asset_source_file_absolute_paths.empty? && minified_asset_file_absolute_path.nil? && minified_asset_file_extension.nil?
      puts ">>>>> Couldn't generate production #{asset_type.upcase} minified asset"
      return
    end

    minified_asset_file_dir_path = File.dirname(minified_asset_file_absolute_path)

    StartupTemplate::FilesUtil.create_directory_if_unavailable(directory_path: minified_asset_file_dir_path)

    # Delete existing asset file for production env
    files_removed =
      StartupTemplate::FilesUtil
        .remove_files_having_given_extension_from_given_dir_path(
          dir_path: minified_asset_file_dir_path,
          file_extension: minified_asset_file_extension)

    unless files_removed.empty?
      puts ">>>>> Removed existing production #{asset_type.upcase} asset file: #{files_removed}"
    end

    asset_source_file_absolute_paths.each do |fp|
      file_contents_minified = minify_asset_file_contents(asset_type: asset_type, asset_file_absolute_path: fp)

      StartupTemplate::FilesUtil
        .append_given_contents_to_given_file_path(
          file_path: minified_asset_file_absolute_path,
          contents: file_contents_minified)
    end

    puts ">>>>> Successfully generated production #{asset_type.upcase} minified asset at path #{minified_asset_file_absolute_path}"
  end

  task :minify_assets do |task, args|
    require "hanami/prepare"
    require 'cssminify2'
    require 'terser'
    require_relative "lib/startup_template/assets_util"
    require_relative "lib/startup_template/files_util"

    unless Hanami.env?(:production)
      abort 'This task is eligible for running on production env only'
    end

    # Important first thing to do
    StartupTemplate::AssetsUtil.generate_fingerprint_for_production_asset

    minify_assets(asset_type: asset_type_css)
    minify_assets(asset_type: asset_type_js)
  end
end


