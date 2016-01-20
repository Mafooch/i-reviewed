Rails.application.routes.draw do
  root to: "books#index"

  resources :books do
    resources :notes, only: [:create, :destroy]
  end

  resources :sessions, only: [:new, :create, :destroy]
  get "/login" => "sessions#new", as: "login"
  delete "/logout" => "sessions#destroy", as: "logout"
  # rerouting because user will think in terms of login and logout, not
  # sessions. the as lets us refer to it throughout the app however we want
  # we no have login_path/login_url/etc..
end
