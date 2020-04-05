Rails.application.routes.draw do
  get 'students/message'
  
  get 'students/profile'

  get 'grads/index'

  get 'grads/search'
  
  get 'grads/new'

  resources :students
  
  resources :users

  root 'grads#index'
end
