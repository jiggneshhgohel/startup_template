# frozen_string_literal: true

module StartupTemplate
  module Actions
    module Doctors
      class Action < StartupTemplate::Action

        private

        def doctor_repository
          ::StartupTemplate::Repositories::DoctorRepository.new
        end
      end
    end
  end
end
