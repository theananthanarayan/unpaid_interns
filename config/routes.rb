Rails.application.routes.draw do
  get 'students/message'
  
  get 'students/profile'

  get 'students/index'

  get 'students/search'
  
  resources :students

  root 'students#index'
end
