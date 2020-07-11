Rails.application.routes.draw do
  resources :authors, only: %i[show index] do
    resources :posts, only: %i[show index new edit]
  end

  resources :posts, only: %i[index show new create edit update]


  
  #scope '/admin', module: 'admin' do
    #resources :stats, only: [:index]
  #end
  
  #creates stats_path and shows the index page 
  #We're telling scope that we want to use /admin as a URL prefix, and we're also letting Rails know that all of the included routes will be handled by controllers in the admin module.
  
  #Fortunately, Rails gives us a shortcut here. When we want to route with a module and use that module's name as the URL prefix, we can use the namespace method instead of scope, module.
  
  namespace :admin do 
    resources :stats, only: [:index]
  end 
  

  root 'posts#index'
end
