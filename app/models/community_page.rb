class CommunityPage
  include Mongoid::Document
  field :title, type: String
  field :content, type: String
  field :identifier, type: String
  mount_uploader :image, ImageUploader

  before_save do |document|
    document.identifier = URI::escape document.title.downcase.gsub(/\s+/, '_')
  end
end
