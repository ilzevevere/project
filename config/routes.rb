Rails.application.routes.draw do
  root 'home#index'

  get 'users/index'

  get 'users/edit'

  resources :users do
    member do
      get 'profile'
      get 'matches'
    end
  end

#For the session create action facebook callback route is added.
  
    get 'auth/:provider/callback', to: 'sessions#create'
    
##For the session destroy action facebook regular delete request to the sessions destroy action is added.

    match 'sign_out', to: 'sessions#destroy', via: :delete
 
end
