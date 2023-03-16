Rails.application.routes.draw do
  root "schedules#index"
  
  resources :groups
  resources :lessons_changes
  resources :schedules, except: %i[new, create, destroy] do
    resources :lessons
  end
  resources :subjects
  resources :teachers
  resources :rooms
end
