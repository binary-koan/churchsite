class Photo
  include Mongoid::Document
  field :caption, type: String
  field :date, type: DateTime
  mount_uploader :image, PhotoUploader

  before_save do |document|
    document.date = DateTime.now unless document.date
  end
end
