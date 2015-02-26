class Photo
  include Mongoid::Document
  field :gallery, type: String, default: "Default"
  field :gallery_id, type: String
  field :caption, type: String
  field :date, type: DateTime #TODO: Is this necessary with explicit ordering?
  field :order, type: Integer, default: 0
  mount_uploader :image, PhotoUploader

  before_save do |document|
    unless document.order
      document.order = Photo.where(gallery_id: document.gallery_id).count
    end
    document.date = DateTime.now unless document.date
    document.gallery_id = Rack::Utils.escape document.gallery.downcase.gsub(/\s+/, '_')
  end
end
