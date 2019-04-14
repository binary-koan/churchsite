class Event
  include Mongoid::Document
  include Mongoid::Timestamps::Updated

  field :title, type: String
  field :content, type: String
  field :show_until, type: Time
  field :special, type: Boolean, default: false
  mount_uploader :image, ImageUploader

  scope :visible, -> { self.or({ show_until: nil }, { :show_until.gte => Time.now }) }
  scope :normal, -> { where(special: false) }
  scope :special, -> { where(special: true) }
end
