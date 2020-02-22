Rails.application.routes.draw do
  get 'grads/index'

  resources :students

  root 'grads#index'
end
