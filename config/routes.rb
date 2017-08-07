Rails.application.routes.draw do
  devise_for :medics
  get 'doctor/index'

  get 'doctor/show'

  get 'doctor/new'

  get 'doctor/edit'

  get 'doctor/create'

  get 'doctor/update'

  get 'doctor/destroy'

  get 'welcome/index'

  resources :patients

  root 'welcome#index'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
