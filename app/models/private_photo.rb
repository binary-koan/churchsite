class PrivatePhoto
  include Mongoid::Document
  include Mongoid::Timestamps::Updated

  belongs_to :private_photo_collection

  mount_uploader :image, PrivatePhotoUploader
end
