# auto_register: false
# frozen_string_literal: true

require 'rom-repository'

module StartupTemplate
  class Repository < ROM::Repository::Root
    include Deps[container: "persistence.rom"]

    struct_namespace Entities
  end
end
