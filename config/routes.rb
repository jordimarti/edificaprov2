Rails.application.routes.draw do
  
  get 'promo_alumni/index'
  get 'clases_passivhaus/cp4ex9'
  get 'clases_passivhaus/cp4ab9'
  get 'clases_passivhaus/tp1ab9'
  get 'clases_passivhaus/tp11n8'
  get 'clases_passivhaus/tp11ex4'
  get 'clases_passivhaus/cp82k7'
  get 'clases_passivhaus/cp82k7vi'
  get 'clases_passivhaus/ph1xd2'
  get 'clases_passivhaus/tp1ex4'
  get 'clases_passivhaus/tp1er9'
  get 'clases_passivhaus/cp13x4'
  get 'clases_passivhaus/cp1xd9'
  get 'clases_passivhaus/cp1xd9fis'
  get 'clases_passivhaus/la45i8m'
  get 'clases_passivhaus/la45i8v'
  get 'clases_passivhaus/d3s3x4'
  get 'clases_passivhaus/pq4rt'
  
  get 'clases_passivhaus/restricted_access' 
  get 'intro_passivhaus/index'

  get 'charges/creditcard'
  get 'charges/credit_card_error'
  get 'charges/pay'

  
  get 'library/passivhaus'
  #get 'library/subcourses'
  resources :promotions
  resources :purchases
  resources :lessons
  resources :sections
  resources :courses do
    resources :subcourses
  end
  devise_for :users
  get 'home/index'
  get 'home/contacta'
  get 'home/access_denied'
  get 'home/legal'
  get 'home/terms'
  #get 'courses/:course_id/subcourses', to: 'subcourses#index', :as => :subcourses
  
  root :to => "home#index"
  match ':controller(/:action(/:id))', :via => [:get, :post]
end
