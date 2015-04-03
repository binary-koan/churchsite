class Church
  include Mongoid::Document
  include Mongoid::Timestamps::Updated
  mount_uploader :image, ImageUploader
  field :name, type: String
  field :services_description, type: String, default: "Services every Sunday at 10:00am"
  field :address, type: String
  field :map_address, type: String
end
