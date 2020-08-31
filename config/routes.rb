Rails.application.routes.draw do
  devise_for :users, controllers: { registrations: 'users/registrations', sessions: 'users/sessions' }
  root "items#index"
  resources :items do
    resources :ordered_items, only: [:index, :new, :create]
    collection do
      get 'search'
    end
  end
  resources :users, only: [:show, :edit, :update]
end