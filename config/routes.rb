Masterstud::Application.routes.draw do
  resources :users
  resource :session

  resources :decks do
    resources :cards, except: :index
  end
end
