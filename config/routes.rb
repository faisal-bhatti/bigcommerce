Rails.application.routes.draw do
  get '/auth/:provider/callback', to: 'accounts#create'
  resources :home, only: [:index]
  root :to => "home#index"
  resources :products do
    collection do
      get 'import'
    end
  end

  resources :accounts do
      resources :products do
        collection do
          get :fetch
        end
      end
   end

end



