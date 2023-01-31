# frozen_string_literal: true

ROM::SQL.migration do
  change do
    create_table :doctors do
      primary_key :id
      column :name, :text, null: false
      column :qualification, :text, null: false

      column :created_at, :timestamp
      column :updated_at, :timestamp
    end
  end
end
