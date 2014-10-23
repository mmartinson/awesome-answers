Rails.application.routes.draw do

  #resources :questions     ###this will create crud routes by default 

  # get '/questions' => 'questions#index'
  # post '/questions' => 'questions#create'
  # get "/questions/:id" => 'questions#show', as: :question
  # get '/question/new' => 'questions#new', as: :new_question
  # get '/questions/:id/edit' => 'questions#edit', as: :edit_question
  # patch '/questions/:id' => 'questions#update'
  # delete '/questions/:id' => 'questions#destroy', as: :destroy_question

  resources :questions do 
    resources :answers, only: [:create, :destroy]
  end

  #can change the helper by including  ", as: some_other_name"
  #gets you some_other_name_path
  get '/welcome' => 'welcome#index'
  get '/faq' => 'welcome#faq'
  root 'questions#index'

end


  # The priority is based upon order of creation: first created -> highest priority.
  # See how all your routes lay out with "rake routes".

  # You can have the root of your site routed with "root"
  # root 'welcome#index'

  # Example of regular route:
  #   get 'products/:id' => 'catalog#view'

  # Example of named route that can be invoked with purchase_url(id: product.id)
  #   get 'products/:id/purchase' => 'catalog#purchase', as: :purchase

  # Example resource route (maps HTTP verbs to controller actions automatically):
  #   resources :products

  # Example resource route with options:
  #   resources :products do
  #     member do
  #       get 'short'
  #       post 'toggle'
  #     end
  #
  #     collection do
  #       get 'sold'
  #     end
  #   end

  # Example resource route with sub-resources:
  #   resources :products do
  #     resources :comments, :sales
  #     resource :seller
  #   end

  # Example resource route with more complex sub-resources:
  #   resources :products do
  #     resources :comments
  #     resources :sales do
  #       get 'recent', on: :collection
  #     end
  #   end

  # Example resource route with concerns:
  #   concern :toggleable do
  #     post 'toggle'
  #   end
  #   resources :posts, concerns: :toggleable
  #   resources :photos, concerns: :toggleable

  # Example resource route within a namespace:
  #   namespace :admin do
  #     # Directs /admin/products/* to Admin::ProductsController
  #     # (app/controllers/admin/products_controller.rb)
  #     resources :products
  #   end
