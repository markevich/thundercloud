Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  # Serve websocket cable requests in-process
  # mount ActionCable.server => '/cable'
  root controller: :application, action: :index

  scope :api do
    resources :tokens, only: :create
  end
end
