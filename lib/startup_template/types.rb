# frozen_string_literal: true

require "dry/types"

module StartupTemplate
  Types = Dry.Types

  module Types
    # Define your custom types here

    # Reference: https://dry-rb.org/gems/dry-validation/1.8/schemas/#using-custom-types
    StrippedString = Types::String.constructor(&:strip)
  end
end

