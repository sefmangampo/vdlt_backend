Rails.application.routes.draw do

  namespace :api do
    namespace :v1 do
      resources :notes
      resource :users, only: [:create]
      

      get '/indexes', to: 'alphabets#index'
      get '/indexes/:name', to: 'alphabets#show'
      post '/indexes', to: 'alphabets#create'
    patch 'indexes/:id', to: 'alphabets#update'


      get 'entry', to: 'word_entries#index'
      get 'entry_by_letter/:id', to: 'word_entries#show_by_letter'
      get 'entry/:name', to: 'word_entries#show_by_slug'
      post 'entry/', to: 'word_entries#create'
      patch 'entry/:id', to: 'word_entries#update'
      delete 'entry/:id', to: 'word_entries#destroy'

      get 'translations_by_entry/:id', to: 'translations#show_translations_by_entry'
      get 'translations', to: 'translations#index'
      get 'translations/:id', to: 'translations#show'
      post 'translations/', to: 'translations#create'
      patch 'translations/:id', to: 'translations#update'
      delete 'translations/:id', to: 'translations#destroy'

      post "/login", to: "users#login"
      get "/auto_login", to: "users#auto_login"
    end
  end



  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
