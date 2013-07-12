Churchsite::Application.routes.draw do

  root to: 'pages#home'
  get "news" => 'pages#news'
  get "news/:date" => 'pages#news'
  get "word" => 'pages#sermons'
  get "word/:id" => 'pages#sermon'
  get "about" => 'pages#about'
  get "activities/:id" => 'pages#community'
  get "gallery" => 'pages#photos'
  get "gallery/:gallery" => 'pages#gallery'

  get "events_in/:year/:month" => 'pages#events_in'

  get "admin" => 'admin#dashboard'
  get "admin/options"
  get "admin/about"
  get "admin/users"
  post "users/confirm" => 'admin#confirm_user'
  delete "users/deny" => 'admin#deny_user'

  scope '/admin' do
    resources :news_items
    resources :churches
    resources :community_pages
    #TODO: Shouldn't be here but form_for needs option_path
    resources :options
    resources :sermons
    resources :photos
  end

  mount Ckeditor::Engine => "/ckeditor"

  devise_for :users#, :path => '', :path_names => {
  #  :sign_in => 'login', :sign_out => 'logout', :sign_up => 'signup'
  #}

  # The priority is based upon order of creation:
  # first created -> highest priority.

  # Sample of regular route:
  #   match 'products/:id' => 'catalog#view'
  # Keep in mind you can assign values other than :controller and :action

  # Sample of named route:
  #   match 'products/:id/purchase' => 'catalog#purchase', :as => :purchase
  # This route can be invoked with purchase_url(:id => product.id)

  # Sample resource route (maps HTTP verbs to controller actions automatically):
  #   resources :products

  # Sample resource route with options:
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

  # Sample resource route with sub-resources:
  #   resources :products do
  #     resources :comments, :sales
  #     resource :seller
  #   end

  # Sample resource route with more complex sub-resources
  #   resources :products do
  #     resources :comments
  #     resources :sales do
  #       get 'recent', :on => :collection
  #     end
  #   end

  # Sample resource route within a namespace:
  #   namespace :admin do
  #     # Directs /admin/products/* to Admin::ProductsController
  #     # (app/controllers/admin/products_controller.rb)
  #     resources :products
  #   end

  # You can have the root of your site routed with "root"
  # just remember to delete public/index.html.
  # root :to => 'welcome#index'

  # See how all your routes lay out with "rake routes"

  # This is a legacy wild controller route that's not recommended for RESTful applications.
  # Note: This route will make all actions in every controller accessible via GET requests.
  # match ':controller(/:action(/:id))(.:format)'
end
