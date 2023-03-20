Rails.application.routes.draw do
  # Sets the starting page (root) to be the index page
  root "games#index"
  resources :games
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
