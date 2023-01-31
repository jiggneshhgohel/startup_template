# frozen_string_literal: true

module StartupTemplate
  module Actions
    module Doctors
      class Remove < Doctors::Action

        include CreateUpdateRemoveHelpers

        def handle(request, response)
          doctor_id = request.params[:id]

          remove_doctor(doctor_id, response)
        end

        private

        def remove_doctor(doctor_id, response)
          bt_clazz = ::StartupTemplate::BusinessTransactions::RemoveDoctor
          bt_step_args_hash = {
            remove: [
              doctor_repo: doctor_repository
            ]
          }

          input_hash = { doctor_id: doctor_id }

          run_business_transaction(bt_clazz: bt_clazz, bt_step_args_hash: bt_step_args_hash, input: input_hash) do |monad|
            action_success_failure_handler(action_type: action_type_remove, monad: monad, response: response)
          end
        end
      end
    end
  end
end
