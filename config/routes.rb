Rails.application.routes.draw do
  
  get 'charges/creditcard'
  get 'charges/credit_card_error'
  get 'charges/pay'

  resources :courses
  get 'library/passivhaus'
  #get 'library/subcourses'
  resources :promotions
  resources :purchases
  resources :lessons
  resources :sections
  resources :subcourses
  devise_for :users
  get 'home/index'
  get 'home/contacta'
  
  root :to => "home#index"
  match ':controller(/:action(/:id))', :via => [:get, :post]
end
