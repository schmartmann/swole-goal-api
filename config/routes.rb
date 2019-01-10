Rails.application.routes.draw do
  mount_devise_token_auth_for 'User', at: 'auth'

  get '/workouts',       to: 'workouts#query', as: 'workouts_query'
  get '/workouts/:uuid', to: 'workouts#read',  as: 'workouts_read'
  post '/workouts',      to: 'workouts#write', as: 'workouts_write'

  get '/exercises',       to: 'exercises#query', as: 'exercises_query'
  get '/exercises/:uuid', to: 'exercises#read',  as: 'exercises_read'
  post '/exercises',      to: 'exercises#write', as: 'exercises_write'
end
