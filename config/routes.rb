Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  root 'pictures#index'

  get 'pictures' => 'pictures#index'

  post 'pictures' => 'pictures#create'
  get 'pictures/new' => 'pictures#new', as: "new_picture"

  get 'pictures/year/:id' => 'pictures#year', as: "pictures_year"

  get 'pictures/:id' => 'pictures#show', as: "show_pictures"

  get 'pictures/:id/edit' => 'pictures#edit', as: "edit_pictures"
  patch 'pictures/:id' => 'pictures#update', as: "picture"

  delete 'pictures/:id' => 'pictures#destroy'

  get 'users/new' => 'users#new', as: "new_users"
  post 'users' => 'users#create'



end
