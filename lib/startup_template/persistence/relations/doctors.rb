# frozen_string_literal: true

module StartupTemplate
  module Persistence
    module Relations
      class Doctors < ROM::Relation[:sql]
        schema(:doctors, infer: true)
      end
    end
  end
end
