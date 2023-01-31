# auto_register: false
# frozen_string_literal: true

module StartupTemplate
  module BusinessTransactions
    class UpdateDoctor < BusinessTransaction

      include CreateEditDoctor::Helpers

      step :validate
      step :update

      private

      def update(input, doctor_id:, doctor_repo:)
        doctor_attrs = extract_doctor_attrs_from_given_input(input)

        doctor_obj = doctor_repo.update(doctor_id, doctor_attrs)

        Success(doctor_obj)
      end

    end
  end
end
