# frozen_string_literal: true

module StartupTemplate
  module Views
    module Doctors
      class Show < View::Base

        config.template = "doctors/show"

        # The scope class set here contains the helper methods
        # used in this view's template
        config.scope = Scopes::Show

        # Note: `doctor_entity_obj` should be available as an exposure from action `StartupTemplate::Actions::Doctors::Show`.
        # And by exposing it here in this view class it should be made
        # available in `locals` set for the instance of `scope` class
        # configured for this view class.
        expose :doctor_entity_obj

      end
    end
  end
end
