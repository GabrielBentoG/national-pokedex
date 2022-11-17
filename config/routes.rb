Rails.application.routes.draw do

  apipie
  resources :pokemons

  resources :types
end
