Rails.application.routes.draw do
  root "pages#display"

  mount Ckeditor::Engine => "/ckeditor"
  devise_for :users, :controllers => { :registrations => :registrations }

  get "uploads/church/image/:id/:filename", to: 'uploads#church_image'
  get "uploads/photo/image/:id/thumb_:filename", to: 'uploads#photo_thumb'
  get "uploads/photo/image/:id/:filename", to: 'uploads#photo_image'
  get "uploads/option/leader_image/:id/:filename", to: 'uploads#leader_image'
  get "uploads/ckeditor/pictures/:id/:filename", to: 'uploads#ckeditor_picture'
  get "uploads/ckeditor/pictures/:id/content_:filename", to: 'uploads#ckeditor_picture_content'
  get "uploads/ckeditor/pictures/:id/thumb_:filename", to: 'uploads#ckeditor_picture_thumb'

  resources :news_items, path: "news", only: [:create, :update, :destroy] do
    get :events_in_month, on: :collection
  end
  resources :sermons, path: "word", except: [:index]
  resources :photos, except: [:index, :show] do
    get "gallery/:id", action: :gallery, on: :collection
    get :reorder, on: :member
    post :reorder, on: :member
  end

  resources :churches, except: [:index, :show]
  resources :options, only: [:edit, :update]
  resources :pages, except: [:show] do
    post :reorder, on: :collection
  end

  resources :community_pages do
    get :reorder, on: :collection
    post :reorder, on: :collection
  end

  scope '/admin' do
    get "users", to: "admin#users"
    post "users/confirm", to: "admin#confirm_user"
    delete "users/deny", to: "admin#deny_user"
  end

  get :toggle_editing, to: "admin#toggle_editing"

  get "/:id", to: "pages#display"
end
