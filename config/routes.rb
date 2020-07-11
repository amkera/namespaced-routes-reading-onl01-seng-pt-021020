Rails.application.routes.draw do
  resources :authors, only: %i[show index] do
    resources :posts, only: %i[show index new edit]
  end

  resources :posts, only: %i[index show new create edit update]


  
  scope '/admin', module: 'admin' do
    resources :stats, only: [:index]
  end
  #creates stats_path and shows the index page 
  #We're telling scope that we want to use /admin as a URL prefix, and we're also letting Rails know that all of the included routes will be handled by controllers in the admin module.
  

  root 'posts#index'
end
