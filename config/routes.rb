# frozen_string_literal: true

Rails.application.routes.draw do
  devise_for :users, controllers: {
    registrations: "users/registrations",
    sessions: "users/sessions",
  }
  # resources :leader, only: [:show]
  get "leaders/show"
  root "homes#index"
  resources :shift_calender
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
