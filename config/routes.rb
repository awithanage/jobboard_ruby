Rails.application.routes.draw do
  devise_for :users
  resources :jobs
  # resources :companies, except: :show do
  # get :show, on: :collection, as: :show
  # end
    resources :users do
       resources :companies
  end

  root 'jobs#index'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
