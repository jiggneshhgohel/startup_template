# frozen_string_literal: true

module StartupTemplate
  module Views
    module Doctors
      class Index < View::Base
        config.template = "doctors/index"

        # The scope class set here contains the helper methods
        # used in this view's template
        config.scope = Scopes::Index

        expose :doctors
      end
    end
  end
end
