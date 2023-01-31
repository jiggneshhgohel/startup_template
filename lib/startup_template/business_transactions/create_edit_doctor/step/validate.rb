# auto_register: false
# frozen_string_literal: true

require 'dry/validation'

Dry::Validation.load_extensions(:monads)

module StartupTemplate
  module BusinessTransactions
    module CreateEditDoctor
      module Step
        class Validate < Dry::Validation::Contract

          params do
            config.types = ::StartupTemplate::TypeContainer

            required(:name).filled(:stripped_string)
            required(:qualification).filled(:stripped_string)
          end

        end
      end
    end
  end
end
