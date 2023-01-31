# frozen_string_literal: true

module StartupTemplate
  module Actions
    module Doctors
      class Show < Doctors::Action

        def handle(request, response)
          doctor_id = request.params[:id]

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
