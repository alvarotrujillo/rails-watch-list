Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
  root 'lists#index'
  resources :lists, only: [:index, :show, :new, :create] do
    resources :bookmarks, only: [:index, :new, :create]
  end
  resources :bookmarks, only: [:destroy]
  # get 'lists/new', to: 'lists#new'
  # get 'lists/:id', to: 'lists#show', as: 'list'
  # post 'lists', to: 'lists#create'
end

# GET "lists/42/bookmarks/new"
# POST "lists/42/bookmarks"
# A user can delete a bookmark from a list. How can we make a delete link again?
# DELETE "bookmarks/25"
