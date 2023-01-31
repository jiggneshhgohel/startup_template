# auto_register: false
# frozen_string_literal: true

module StartupTemplate
  module Actions
    module Doctors
      module CreateUpdateRemoveHelpers

        private

        def action_type_create
          :create
        end

        def action_type_update
          :update
        end

        def action_type_remove
          :remove
        end

        def extract_input_data_from_request(request)
          {
            name: request.params[:doctor][:name],
            qualification: request.params[:doctor][:qualification]
          }
        end

        def success_message(action_type:)
          action_name_for_message =
            case action_type
              when action_type_create
                'created'
              when action_type_update
                'updated'
              when action_type_remove
                'removed'
              else
                # nil
            end

          "Doctor #{action_name_for_message} successfully"
        end

        def error_message(action_type:)
          action_name_for_message =
            case action_type
              when action_type_create
                'creation'
              when action_type_update
                'update'
              when action_type_remove
                'removal'
              else
                # nil
            end

          "Doctor #{action_name_for_message} failed"
        end

        def action_success_failure_handler(action_type:, monad:, response:)
          monad.success do |doctor|

            success_msg = success_message(action_type: action_type)

            set_success_in_flash(response: response, message: success_msg, is_for_redirect_request: true)

            response.redirect_to( routes.path(:doctors_doctors) )
          end

          monad.failure :validate do |validation|
            # Note: validation should be an instance of `Dry::Validation::Result`

            errors_hash = validation.errors.to_h

            errors_msg = transform_errors_hash_to_error_message(errors_hash: errors_hash)

            error_msg_prefix = error_message(action_type: action_type)

            set_error_in_flash(response: response, message: "#{error_msg_prefix}. Following errors found: #{errors_msg}")
          end

          monad.failure do |error|
            # Runs for any other failure

            error_msg = error_message(action_type: action_type)

            set_error_in_flash(response: response, message: error_msg)
          end
        end

        def run_business_transaction(bt_clazz:, bt_step_args_hash:, input:, &block)
          transaction_obj = bt_clazz.new

          transaction_obj.with_step_args(**bt_step_args_hash).call(input) do |m|
            block.call(m)
          end
        end
      end
    end
  end
end
