class Sermon
  include Mongoid::Document
  field :date, type: Date, default: Date.today
  field :description, type: String
  field :content, type: String
  mount_uploader :podcast_ogg, AudioUploader
  mount_uploader :podcast_mp3, AudioUploader

  before_save do |document|
    if document[:'date(1i)']
      document.date = Date.new document[:'date(1i)'].to_i, document[:'date(2i)'].to_i, document[:'date(3i)'].to_i
    elsif not document.date
      document.date = Date.today
    end
  end
end
