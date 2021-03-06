Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  root 'pictures#index'

  get 'pictures' => 'pictures#index'

  get 'pictures/new' => 'pictures#new', as: "new_picture"
  post 'pictures' => 'pictures#create'

  get 'pictures/:id' => 'pictures#show', as: "show_picture"

  get 'pictures/:id/edit' => 'pictures#edit', as: "edit_picture"
  patch 'pictures/:id' => 'pictures#update', as: "picture"

  delete 'pictures/:id' => 'pictures#destroy'

  get 'pictures/year/:id' => 'pictures#year', as: "pictures_year"

  get 'users/new' => 'users#new', as: "new_user"
  post 'users' => 'users#create'

  get 'sessions/new' => 'sessions#new', as: "new_session"

  post 'sessions/create' => 'sessions#create'

  delete 'sessions/destory' => 'sessions#destroy'



end
