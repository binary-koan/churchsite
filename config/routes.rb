Rails.application.routes.draw do
  root 'site#home'
  get "news", to: 'site#news'
  get "news/:date", to: 'site#news'
  get "word", to: 'site#sermons'
  get "word/:id", to: 'site#sermon'
  get "about", to: 'site#about'
  get "activities/:id", to: 'site#community'
  get "gallery", to: 'site#photos'
  get "gallery/:gallery", to: 'site#gallery'

  get "events_in/:year/:month", to: 'site#events_in'

  get "uploads/church/image/:id/:filename", to: 'uploads#church_image'
  get "uploads/photo/image/:id/thumb_:filename", to: 'uploads#photo_thumb'
  get "uploads/photo/image/:id/:filename", to: 'uploads#photo_image'
  get "uploads/option/leader_image/:id/:filename", to: 'uploads#leader_image'
  get "uploads/ckeditor/pictures/:id/:filename", to: 'uploads#ckeditor_picture'
  get "uploads/ckeditor/pictures/:id/content_:filename", to: 'uploads#ckeditor_picture_content'
  get "uploads/ckeditor/pictures/:id/thumb_:filename", to: 'uploads#ckeditor_picture_thumb'

  get "admin", to: 'admin#dashboard'
  get "admin/options"
  get "admin/about"
  get "admin/users"
  post "users/confirm", to: 'admin#confirm_user'
  delete "users/deny", to: 'admin#deny_user'

  scope '/admin' do
    resources :news_items
    resources :churches
    get 'community_pages/reorder'
    post 'community_pages/reorder'
    resources :community_pages
    #TODO: Shouldn't be here but form_for needs option_path
    resources :options
    resources :sermons
    get 'photos/:id/reorder', to: 'photos#reorder'
    post 'photos/:id/reorder', to: 'photos#reorder'
    resources :photos
  end

  mount Ckeditor::Engine => "/ckeditor"

  devise_for :users, :controllers => { :registrations => :registrations }
end
