Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html

  get 'top/index'

  #イベント投稿
  # get 'imageposts/index'
  # get 'imageposts/top'
  # get "imageposts/index" => "imageposts#index"

  get "imagepost∏s/new" => "imageposts#new"
  get "imageposts/:id" => "imageposts#show"
  post "imageposts/create" => "imageposts#create"

  resources :pictures
  root 'top#index'
end
