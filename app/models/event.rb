class Event
  include Mongoid::Document

  field :title, type: String
  field :content, type: String
  field :date_description, type: String
  field :show_until, type: Time
  field :special, type: Boolean
  mount_uploader :image, ImageUploader
end
