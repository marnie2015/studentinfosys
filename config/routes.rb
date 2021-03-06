Rails.application.routes.draw do

  
  # start of javascript calls
  get '/get-sections' => 'students#get_sections'
  get '/save-grade' => 'grades#save_grade'
  # end of javascript calls

  resources :sections
  resources :rooms
  get '/logout' => 'home#logout'
  post '/login' => 'home#login'
  resources :teachers
  resources :positions
  resources :events
  resources :users
  resources :schedules
  resources :subjects
  get '/schedules/student/:year_level_id/:section_id' => 'schedules#student_show'
  post '/change-password' => 'users#change_password'
  get '/change-password' => 'home#change_password'
  get '/grades' => 'grades#index'
  get '/grades/show/:id' => 'grades#show'
  get '/main' => 'home#main'
  get '/schedule' => 'home#schedule'
  get '/students-main' => 'home#students_main'
  post '/pay' => 'payments#pay'
  get '/payform/:student_id' => 'payments#payform'
  get '/payments/print/:or_number' => 'payments#print'
  get '/payments' => 'payments#index'
  get '/payments/:student_id' => 'payments#history'
  get '/get-payment' => 'payments#get_payment'
  
  resources :students
  root 'home#index'
  

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
end
