# frozen_string_literal: true

module StartupTemplate
  module Actions
    module Doctors
      class Create < Doctors::Action

        include CreateUpdateRemoveHelpers

        def handle(request, response)
          input_hash = extract_input_data_from_request(request)

          create_doctor(input_hash, response)
        end

        private

        def create_doctor(input_hash, response)
          bt_clazz = ::StartupTemplate::BusinessTransactions::CreateDoctor
          bt_step_args_hash = {
            create: [
              doctor_repo: doctor_repository
            ]
          }

          run_business_transaction(bt_clazz: bt_clazz, bt_step_args_hash: bt_step_args_hash, input: input_hash) do |monad|
            action_success_failure_handler(action_type: action_type_create, monad: monad, response: response)
          end
        end
      end
    end
  end
end
