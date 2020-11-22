Rails.application.routes.draw do
  devise_for :users
  get 'schedules/index'
  root to: "schedules#index"
  resources :schedules do
    collection do
      get 'search'
    end
    resources :comments, only: :create
    resources :profiles, only: [:new, :create, :show, :edit, :update]
  end
end
