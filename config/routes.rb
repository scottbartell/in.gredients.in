GredientsIn::Application.routes.draw do
  get 'recipes', to: 'recipes#index'

  get 'recipes/:permalink', to: 'recipes#show', as: 'recipe'

  root to: "home#index"
end
