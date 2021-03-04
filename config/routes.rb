Rails.application.routes.draw do
  devise_for :users

  patch '/projects/:project_id/tasks/:id/move_up', to: 'tasks#priority_up', as: :task_priority_up
  patch '/projects/:project_id/tasks/:id/move_down', to: 'tasks#priority_down', as: :task_priority_down
  patch '/tasks/complete', to: 'tasks#complete', as: :task_complete

  resources :projects, except: %i[show] do 
    resources :tasks, except: %i[index show]
  end

  root 'projects#index'
end
