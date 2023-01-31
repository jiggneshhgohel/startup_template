# auto_register: false
# frozen_string_literal: true

module StartupTemplate
  module BusinessTransactions
    class RemoveDoctor < BusinessTransaction

      # TODO: Add validate step which ensures that an inexistent record
      # attempted to be removed fails with a validation error.

      step :remove

      private

      def remove(input, doctor_repo:)
        doctor_id = input[:doctor_id]

        doctor_repo.remove(doctor_id)

        Success(true)
      end

    end
  end
end
