# frozen_string_literal: true

Rails.application.routes.draw do
  devise_for :users, controllers: {
    registrations: "users/registrations",
    sessions: "users/sessions",
  }

  get "leaders/show"
  root "homes#index"
  resources :shift_calenders
end
