class Sermon
  include Mongoid::Document
  field :date, type: Date, default: Date.today
  field :description, type: String
  field :content, type: String
  mount_uploader :podcast_ogg, AudioUploader
  mount_uploader :podcast_mp3, AudioUploader

  before_save do |document|
    document.date = Date.today unless document.date
  end
end
