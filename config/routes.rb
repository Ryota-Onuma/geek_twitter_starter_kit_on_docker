Rails.application.routes.draw do
  root to: 'rooms#index'
  get 'rooms/index' => 'rooms#index',as: "rooms"
  get 'rooms/show/:user_id' => 'rooms#show',as:"room"
  post '/callback' => 'linebot#callback'
  post '/push_message' => 'linebot#push_message',as: 'post_message'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
