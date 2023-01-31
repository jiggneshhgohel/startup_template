# auto_register: false
# frozen_string_literal: true

module StartupTemplate
  module BusinessTransactions
    class CreateDoctor < BusinessTransaction

      include CreateEditDoctor::Helpers

      step :validate
      step :create

      private

      def create(input, doctor_repo:)
        doctor_attrs = extract_doctor_attrs_from_given_input(input)

        doctor_obj = doctor_repo.create(doctor_attrs)

        Success(doctor_obj)
      end

    end
  end
end
