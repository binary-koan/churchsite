class PrivatePhotoCollection
  include Mongoid::Document
  include Mongoid::Timestamps::Updated
  include ActiveModel::SecurePassword

  field :name, type: String
  field :username, type: String
  field :password_digest, type: String

  has_secure_password

  has_many :private_photos
end
