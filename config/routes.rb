Rails.application.routes.draw do

  scope "(:locale)", locale: /en|es/ do
    devise_for :users, controllers: {registrations: 'users/registrations', sessions: 'users/sessions'}

    resources :patients
    get 'user_root' => 'patients#index'

    root to: 'welcome#index'
  end
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
