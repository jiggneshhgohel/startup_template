# frozen_string_literal: true

module StartupTemplate
  module Views
    module Doctors
      class New < View::Base

        config.template = "doctors/new"

        # The scope class set here contains the helper methods
        # used in this view's template
        config.scope = Scopes::New
      end
    end
  end
end
