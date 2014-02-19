GolfscoreGrapher::Application.routes.draw do
  resources :players do
    member do
      get :autocomplete
    end
  end
  resources :games

  root "welcome#index"
end
