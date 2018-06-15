Rails.application.routes.draw do
  devise_for :users
  
  namespace :api, path: "/" do
    namespace :v1 do
      resources :boards
      resources :lists
      resources :cards
    end
  end
  
end
