# auto_register: false
# frozen_string_literal: true

module StartupTemplate
  module FilesUtil
    extend self

    def search_files_having_given_extension_in_given_dir_path(dir_path:, file_extension:)
      glob_pattern = "*.#{file_extension}"

      files_found = Dir.glob(glob_pattern, base: dir_path)

      files_found
    end

    def remove_files_having_given_names_under_given_dir_path(dir_path:, file_names:)
      absolute_paths_of_files_found =
        file_names.map do |file_name|
          pathname = Pathname.new(dir_path)
          pathname = pathname.join(file_name)
          pathname.to_s
        end

      FileUtils.remove(absolute_paths_of_files_found)

      absolute_paths_of_files_found
    end

    def remove_files_having_given_extension_from_given_dir_path(dir_path:, file_extension:)
      files_found = search_files_having_given_extension_in_given_dir_path(dir_path: dir_path, file_extension: file_extension)

      return files_found if files_found.empty?

      remove_files_having_given_names_under_given_dir_path(dir_path: dir_path, file_names: files_found)
    end

    def append_given_contents_to_given_file_path(file_path:, contents:)
      # Reference: https://stackoverflow.com/questions/4795447/rubys-file-open-and-the-need-for-f-close
      File.open(file_path, 'a') { |file| file.write(contents) }
    end

    # For a valid mode value refer https://blog.udemy.com/ruby-file-open/
    def create_file(file_path:, contents:, mode:)
      File.write(file_path, contents, mode: mode)
    end

    def read_file(file_path:)
      File.read(file_path)
    end
  end
end
