Rails.application.routes.draw do
  root "pokemons#index"

  resources :pokemons, only: %w[index] do
    member do
      patch 'toggle_captured'
    end
  end
end
