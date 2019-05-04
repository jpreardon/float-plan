Rails.application.routes.draw do
  root "static_pages#home"
  get 'static_pages/home'
  get 'static_pages/float_plans'
  get 'static_pages/fleet'
  get 'static_pages/crew'
  get 'static_pages/new_float_plan'
  resources :users
end
