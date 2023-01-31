# auto_register: false
# frozen_string_literal: true

module StartupTemplate
  module Views
    module Doctors
      module Scopes
        class Show < View::Scope
          private

          def doctor_entity_obj
            locals[:doctor_entity_obj]
          end

          def doctor_name
            doctor_entity_obj.name
          end

          def doctor_qualification
            doctor_entity_obj.qualification
          end

          def back_to_doctors_listing_link
            route_opts = {
              name: :doctors_doctors
            }

            opts = {
              css_classes: 'doctors-listing'
            }

            button_link(button_name: 'Back To Doctors', route_opts: route_opts, opts: opts)
          end

        end
      end
    end
  end
end
