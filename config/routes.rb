Rails.application.routes.draw do

  devise_for :users, :controllers => { :registrations => "user/registrations" }
  resources :projects, :shallow => true do
    resources :bugs do
      resources :steps
      resources :pictures
    end
    resources :userprojects
  end

  root 'projects#index'

end
