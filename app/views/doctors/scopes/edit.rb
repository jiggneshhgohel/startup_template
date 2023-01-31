# auto_register: false
# frozen_string_literal: true

module StartupTemplate
  module Views
    module Doctors
      module Scopes
        class Edit < View::Scope
          private

          include FormHelpers

          def doctor_id
            locals[:doctor_id]
          end

          def doctor_entity_obj
            locals[:doctor_entity_obj]
          end

          def edit_doctor_form
            form_action_path = app_route_path(route_name_sym: :doctors_update_doctor, id: doctor_id)
            form_submit_button_name = 'Save Changes'

            _doctor_form(
              form_action_path: form_action_path,
              form_submit_button_name: form_submit_button_name,
              doctor_obj: doctor_entity_obj,
              doctor_id: doctor_id)
          end

        end
      end
    end
  end
end
