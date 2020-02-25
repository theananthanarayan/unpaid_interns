Rails.application.routes.draw do
  get 'students/profile'

  get 'grads/index'

  resources :students

  root 'grads#index'
end
