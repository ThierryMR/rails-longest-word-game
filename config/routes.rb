Rails.application.routes.draw do
  # get "games/new"
  # post 'games/score'
  get 'new', to: 'games#new', as: 'new'
  post 'score', to: 'games#score', as: 'score'
  # get 'score', to: 'games#score', as: 'score'
end
