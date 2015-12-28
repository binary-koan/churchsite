class Photo
  include Mongoid::Document
  include Mongoid::Timestamps::Updated
  field :gallery, type: String
  field :caption, type: String
  field :date, type: DateTime #TODO: Is this necessary with explicit ordering?
  field :order, type: Integer, default: 0
  mount_uploader :image, PhotoUploader

  before_save do |document|
    unless document.order
      document.order = Photo.where(gallery_id: document.gallery_id).count
    end
    document.date = DateTime.now unless document.date
  end

  def gallery_id
    gallery.parameterize if gallery
  end
end
