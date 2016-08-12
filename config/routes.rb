Rails.application.routes.draw do
  root "pages#display"

  mount Ckeditor::Engine => "/ckeditor"
  devise_for :users, :controllers => { :registrations => :registrations }

  get "uploads/attachment/attachment/:id/:filename", to: 'uploads#attachment'
  get "uploads/church/image/:id/:filename", to: 'uploads#church_image'
  get "uploads/photo/image/:id/thumb_:filename", to: 'uploads#photo_thumb'
  get "uploads/photo/image/:id/:filename", to: 'uploads#photo_image'
  get "uploads/option/leader_image/:id/:filename", to: 'uploads#leader_image'
  get "uploads/ckeditor/pictures/:id/:filename", to: 'uploads#ckeditor_picture'
  get "uploads/ckeditor/pictures/:id/content_:filename", to: 'uploads#ckeditor_picture_content'
  get "uploads/ckeditor/pictures/:id/thumb_:filename", to: 'uploads#ckeditor_picture_thumb'

  resources :sermons, path: "word", except: [:index]

  resources :news_items, path: "news", only: [:create, :update, :destroy] do
    get :events, on: :collection
  end

  resources :photos, except: [:index, :show] do
    get :gallery, action: :gallery, on: :collection
    post "gallery/reorder", action: :reorder, on: :collection

    post :rename_gallery, action: :rename_gallery, on: :collection
    delete :delete_gallery, action: :delete_gallery, on: :collection
  end

  resources :churches, except: [:index, :show]

  resources :options, only: [:edit, :update]

  resources :pages, except: [:show] do
    post :reorder, on: :collection
  end

  scope "/admin" do
    get "/", to: "admin#redirect"

    get :users, to: "admin#users"
    post "users/confirm", to: "admin#confirm_user"
    delete "users/deny", to: "admin#deny_user"

    get :toggle_editing, to: "admin#toggle_editing"
  end

  get "/:id", to: "pages#display"
end
