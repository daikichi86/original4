Rails.application.routes.draw do
  get 'mains/index'
  root to: 'mains#index'

  resources :mains, only:[:index]
  resources :places do
    resources :comments, only:[:create]
  end
end
