Rails.application.routes.draw do
  resources :groups
  root "schedules#index"
  
  resources :lessons_changes
  resources :lessons
  resources :schedules, except: %i[new, create, destroy]
  resources :subjects
  resources :teachers
  resources :rooms
end
