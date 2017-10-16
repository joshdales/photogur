Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  root 'pictures#index'

  get 'pictures' => 'pictures#index'

  post 'pictures' => 'pictures#create'
  get 'pictures/new' => 'pictures#new'

  get 'pictures/year/:id' => 'pictures#year', as: "pictures_year"

  get 'pictures/:id' => 'pictures#show', as: "pictures_show"

  get 'pictures/:id/edit' => 'pictures#edit', as: "pictures_edit"
  patch 'pictures/:id' => 'pictures#update'

  delete 'pictures/:id' => 'pictures#destroy'



end
