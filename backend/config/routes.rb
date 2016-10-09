Rails.application.routes.draw do
  resources :theatres
    get '/angelika', to: 'theatres#angelika'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
