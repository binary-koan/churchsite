class Photo
  include Mongoid::Document
  include Mongoid::Timestamps::Updated

  field :gallery, type: String
  field :caption, type: String
  field :order, type: Integer, default: -> { Photo.count }

  mount_uploader :image, PhotoUploader
end
