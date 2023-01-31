# auto_register: false
# frozen_string_literal: true

require "dry/transaction"

module StartupTemplate
  class BusinessTransaction
    include Dry::Transaction

  end
end
