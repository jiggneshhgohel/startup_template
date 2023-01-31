# frozen_string_literal: true

module StartupTemplate
  module Actions
    module Doctors
      class Edit < Doctors::Action

        def handle(request, response)
          doctor_id = request.params[:id]

          # TODO: How to handle record not found? Ideally an error should be shown in the view so let's try that out.

          response[:doctor_id] = doctor_id
          response[:doctor_entity_obj] = get_doctor(doctor_id)
        end

        private

        def get_doctor(doctor_id)
          doctor_repository.find_by_id(doctor_id)
        end
      end
    end
  end
end
