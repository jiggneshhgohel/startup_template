# frozen_string_literal: true

module StartupTemplate
  module Actions
    module Doctors
      class Update < Doctors::Action

        include CreateUpdateRemoveHelpers

        def handle(request, response)
          doctor_id = request.params[:id]

          response[:doctor_id] = doctor_id

          input_hash = extract_input_data_from_request(request)

          update_doctor(doctor_id, input_hash, response)
        end

        private

        def update_doctor(doctor_id, input_hash, response)
          bt_clazz = ::StartupTemplate::BusinessTransactions::UpdateDoctor
          bt_step_args_hash = {
            update: [
              doctor_id: doctor_id,
              doctor_repo: doctor_repository
            ]
          }

          run_business_transaction(bt_clazz: bt_clazz, bt_step_args_hash: bt_step_args_hash, input: input_hash) do |monad|
            action_success_failure_handler(action_type: action_type_update, monad: monad, response: response)
          end
        end
      end
    end
  end
end
