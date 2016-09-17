Rails.application.routes.draw do
  resources :config_elements
  resources :case_tests do
    get :run
    post :search, on: :collection
  end

  devise_for :users, only: :session, path: 'session',
             path_names: { sign_in: 'login', sign_out: 'logout' }
  resources :users, only: [:show]

  root to: 'visitors#index'
end
