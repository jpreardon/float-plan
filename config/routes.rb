Rails.application.routes.draw do
  get 'static_pages/home'
  get 'static_pages/float_plans'
  get 'static_pages/fleet'
  root "static_pages#home"
end
