# frozen_string_literal: true

Rails.application.routes.draw do
  # resources :shelters
  get '/shelters', to: 'shelters#index'
  get '/shelters/new', to: 'shelters#new'
  get '/shelters/:id', to: 'shelters#show'
  post '/shelters', to: 'shelters#create'
  get '/shelters/:id/edit', to: 'shelters#edit'
  patch '/shelters/:id', to: 'shelters#update'
  delete '/shelters/:id', to: 'shelters#destroy'

  get '/shelters/:shelter_id/reviews/new', to: 'reviews#new'
  post '/shelters/:shelter_id', to: 'reviews#create'
  get '/shelters/:shelter_id/reviews/:review_id/edit', to: 'reviews#edit'
  patch '/shelters/:shelter_id/reviews/:review_id', to: 'reviews#update'
  delete '/shelters/:shelter_id/reviews/:review_id', to: 'reviews#destroy'

  # resources :pets, only: [:index, :show]
  get '/pets', to: 'pets#index'
  get '/pets/:id', to: 'pets#show'
  get '/shelters/:shelter_id/pets/new', to: 'pets#new'
  post '/shelters/:shelter_id/pets', to: 'pets#create'

  get '/shelters/:shelter_id/pets', to: 'shelter_pets#index'

  get '/shelters/:id/pets/:id', to: 'pets#show'
  get '/shelters/:id/pets/:id/edit', to: 'pets#edit'
  patch '/shelters/:shelter_id/pets/:pet_id', to: 'pets#update'
  delete '/shelters/:shelter_id/pets/:pet_id', to: 'pets#destroy'

  patch '/favorite/:pet_id', to: 'favorite#update'
  # patch '/favorite/:id', to: 'favorite#update'
  get '/favorite', to: 'favorite#index'
end
