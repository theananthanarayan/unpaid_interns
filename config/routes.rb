Rails.application.routes.draw do
  get 'students/message'
  
  get 'students/profile'

  get 'grads/index'

  get 'grads/search'

  resources :students

  root 'grads#index'
end
