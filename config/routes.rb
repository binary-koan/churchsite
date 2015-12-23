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

  resources :news_items, path: "news", except: [:index]
  resources :sermons, path: "word", except: [:index]
  resources :photos, except: [:index] do
    get :reorder, on: :member
    get :reorder, on: :member
  end

  scope '/admin' do
    get "users", to: "admin#users"
    post "users/confirm", to: "admin#confirm_user"
    delete "users/deny", to: "admin#deny_user"

    resources :churches, except: [:index, :show]
    resources :pages, except: [:show]
    resources :options, only: [:edit, :update]

    resources :community_pages do
      get :reorder
      post :reorder
    end
  end

  get "gallery/:id", to: "site#gallery"
  get "events_in/:year/:month", to: "site#events_in"

  get "/:id", to: "pages#display"
end
