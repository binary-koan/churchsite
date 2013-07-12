class Photo
  include Mongoid::Document
  field :gallery, type: String, default: "Default"
  field :gallery_id, type: String
  field :caption, type: String
  field :date, type: DateTime
  mount_uploader :image, PhotoUploader

  before_save do |document|
    document.date = DateTime.now unless document.date
    document.gallery_id = Rack::Utils.escape document.gallery.downcase.gsub(/\s+/, '_')
  end
end
