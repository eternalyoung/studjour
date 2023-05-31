Rails.application.routes.draw do
  root "groups#index"

  resources :lessons_changes
  resources :groups do
    resources :schedules, except: %i[new create destroy] do
      resources :lessons
    end
  end

  resources :subjects, only: [:edit, :update, :new, :create, :destory]
  resources :teachers, only: [:edit, :update, :new, :create, :destory]
  resources :rooms, only: [:edit, :update, :new, :create, :destory]

  get "profile", to: "users#show"
  get "profile/edit", to: "users#edit"
  patch "profile", to: "users#update"
end
