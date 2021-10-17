# frozen_string_literal: true

Rails.application.routes.draw do
  devise_for :users, controllers: {
    registrations: "users/registrations",
    sessions: "users/sessions",
  }
  # resources :leader, only: [:show]
  get "leaders/show"
  root "homes#index"
  namespace :leaders do
   resources :shift_calender
  end
end
