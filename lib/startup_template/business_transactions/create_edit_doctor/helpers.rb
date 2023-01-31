# auto_register: false
# frozen_string_literal: true

module StartupTemplate
  module BusinessTransactions
    module CreateEditDoctor
      module Helpers

        private

        def validate(input)
          step_obj = Step::Validate.new
          step_obj.call(input).to_monad
        end

        def extract_doctor_attrs_from_given_input(input)
          {
            name: input[:name],
            qualification: input[:qualification]
          }
        end
      end
    end
  end
end
