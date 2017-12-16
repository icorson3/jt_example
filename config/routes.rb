Rails.application.routes.draw do
  resources :dashboard, only: [:index]
  resources :companies do
    resources :jobs
    resources :contacts, only: [:create]
  end

  resources :jobs do
    resources :comments, only: [:new, :create]
  end

  resources :categories

end
