# frozen_string_literal: true

module StartupTemplate
  class Routes < Hanami::Routes
    root to: "home.show"

    scope "doctors" do
      get "/", to: "doctors.index", as: :doctors
      get "/:id", to: "doctors.show", as: :show_doctor
      get "/new", to: "doctors.new", as: :new_doctor
      post "/", to: "doctors.create", as: :create_doctor
      get "/:id/edit", to: "doctors.edit", as: :edit_doctor
      patch "/:id", to: "doctors.update", as: :update_doctor
      delete "/:id", to: "doctors.remove", as: :remove_doctor
    end

    slice :admin, at: "/admin" do
    end
  end
end
