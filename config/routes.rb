Rails.application.routes.draw do
  root "schedules#index"
  
  resources :lessons_changes
  resources :lessons
  resources :schedules
  resources :subjects
  resources :teachers
  resources :rooms
end
