# frozen_string_literal: true

module StartupTemplate
  module Views
    module Home
      class Show < View::Base
        config.template = "home/show"

        # The scope class set here contains the helper methods
        # used in this view's template
        config.scope = Scopes::Show
      end
    end
  end
end
