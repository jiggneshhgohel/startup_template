# frozen_string_literal: true

module StartupTemplate
  module Actions
    module Doctors
      class Index < Doctors::Action

        def handle(request, response)
          response[:doctors] = get_all_doctors
        end

        private

        def get_all_doctors
          doctor_repository.find_all
        end
      end
    end
  end
end
