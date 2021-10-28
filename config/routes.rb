Rails.application.routes.draw do
  devise_for :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resources:tasks,only:[:index,:create] do
    resources:statuses,only:[:create,:destroy]
  end
  get "tasks/finished"=>"statuses#index" ,as:"finished_tasks"
  root to:"homes#top"
end
