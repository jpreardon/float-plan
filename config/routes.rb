Rails.application.routes.draw do
  root  "static_pages#home"
  get   '/home',            to: 'static_pages#home'
  get   '/float_plans',     to: 'static_pages#float_plans'
  get   '/fleet',           to: 'static_pages#fleet'
  get   '/crew',            to: 'static_pages#crew'
  get   '/float_plans/new', to: 'static_pages#new_float_plan'
  get   '/login',           to: 'sessions#new'
  post  '/login',           to: 'sessions#create'
  get   '/logout',          to: 'sessions#destroy'
  resources :users
end
