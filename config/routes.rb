Rails.application.routes.draw do
  
  get 'clases_passivhaus/z48ym'
  get 'clases_passivhaus/xk98e'
  get 'clases_passivhaus/gc8x'
  get 'clases_passivhaus/pr6w2'
  get 'clases_passivhaus/z6k9m'
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
