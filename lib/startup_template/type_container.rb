# frozen_string_literal: true

module StartupTemplate
  TypeContainer = Dry::Schema::TypeContainer.new

  # Reference: https://dry-rb.org/gems/dry-schema/1.10/advanced/custom-types/
  TypeContainer.register('params.stripped_string', Types::StrippedString)
end

