# auto_register: false
# frozen_string_literal: true

module StartupTemplate
  module Views
    module Doctors
      module Scopes
        class New < View::Scope
          private

          include FormHelpers

          def new_doctor_form
            form_action_path = app_route_path(route_name_sym: :doctors_create_doctor)
            form_submit_button_name = 'Create Doctor'

            _doctor_form(form_action_path: form_action_path, form_submit_button_name: form_submit_button_name)
          end

        end
      end
    end
  end
end
