# frozen_string_literal: true

module StartupTemplate
  module Views
    module Doctors
      class Edit < View::Base

        config.template = "doctors/edit"

        # The scope class set here contains the helper methods
        # used in this view's template
        config.scope = Scopes::Edit

        # Note: `doctor_id` should be available as an exposure from action `StartupTemplate::Actions::Doctors::Edit`.
        # And by exposing it here in this view class it should be made
        # available in `locals` set for the instance of `scope` class
        # configured for this view class.
        expose :doctor_id

        # Note: Note added on `expose :doctor_id` is applicable here too.
        expose :doctor_entity_obj

      end
    end
  end
end
