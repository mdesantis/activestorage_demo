Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  root 'posts#index'

  resources :posts

  # destroy route for attachments and blobs - GET is defined in activestorage/config/routes.rb
  delete '/rails/active_storage/blobs/:signed_id/*filename' => 'blobs#destroy'
end
