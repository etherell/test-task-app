# frozen_string_literal: true

Rails.application.routes.draw do
  root to: 'tickets#index'

  namespace :api, defaults: { format: 'json' } do
    namespace :v1 do
      resources :tickets, only: [:create]
    end
  end

  resources :tickets, only: %i[index show]
end
