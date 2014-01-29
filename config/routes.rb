GolfscoreGrapher::Application.routes.draw do
  resources :players

  root "welcome#index"
end
