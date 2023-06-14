Rails.application.routes.draw do
  root "groups#index"

  resources :groups do
    get :my, on: :collection
    resources :schedules, except: %i[new create destroy] do
      resources :lessons
    end
  end
  resources :subjects, only: [:edit, :update, :new, :create, :destory]
  resources :teachers, only: [:edit, :update, :new, :create, :destory]

  resources :lessons_changes

  resource :week_status, only: [] do
    post :toggle, on: :collection
  end

  resources :events, except: %i[show]
  resources :subscriptions, only: :create
  delete "/subscriptions", to: "subscriptions#destroy"

  get "profile", to: "users#show"
  get "profile/edit", to: "users#edit"
  patch "profile", to: "users#update"
end
