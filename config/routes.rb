# frozen_string_literal: true

Rails.application.routes.draw do
  root 'task#input'
  get 'task/input', to: 'task#input'
  post 'task/show'
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
end
