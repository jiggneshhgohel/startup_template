# auto_register: false
# frozen_string_literal: true

require 'hanami/view/scope'

# Note: This class is intended to be subclassed by each custom scope class
# we desire to introduce in our application.

module StartupTemplate
  module View
    class Scope < Hanami::View::Scope
      include View::CommonHelpers

    end
  end
end
