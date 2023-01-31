# auto_register: false
# frozen_string_literal: true

module StartupTemplate
  module Views
    module Doctors
      module Scopes
        class Index < View::Scope
          private

          def new_doctor_link
            route_opts = {
              name: :doctors_new_doctor
            }

            opts = {
              css_classes: 'new-doctor'
            }

            button_link(button_name: 'Add Doctor', route_opts: route_opts, opts: opts)
          end

          def show_doctor_link(doctor_id:, doctor_name:)
            route_opts = {
              name: :doctors_show_doctor,
              args: { id: doctor_id }
            }

            opts = {
              css_classes: 'doctor-details-page'
            }

            link(route_opts: route_opts, link_name: doctor_name, opts: opts)
          end

          def edit_doctor_link(doctor_id:)
            route_opts = {
              name: :doctors_edit_doctor,
              args: { id: doctor_id }
            }

            opts = {
              css_classes: 'edit-doctor'
            }

            button_link(button_name: 'Edit', route_opts: route_opts, opts: opts)
          end

          def remove_doctor_button(doctor_id:)
            route_opts = {
              name: :doctors_remove_doctor,
              args: { id: doctor_id }
            }

            remove_route_path = construct_link_path(route_opts: route_opts)

            opts = {
              css_classes: 'remove-doctor',
              data_attrs: {
                "data-remove-path" => remove_route_path
              }
            }

            button(button_name: 'Remove', opts: opts)
          end

          def remove_doctor_form
            form_name = :remove_doctor
            form_url = EMPTY_STRING # This is intended to be set by JS.

            form_method_option_value = :delete

            form_for(form_name, form_url, method: form_method_option_value) do
              # We do not need any content for this form but not passing
              # any content the CSRF token doesn't get included. Thus
              # passing an empty <span>.
              #
              span EMPTY_STRING
            end
          end

        end
      end
    end
  end
end
