class Sermon
  include Mongoid::Document
  field :date, type: Date, default: Date.today
  field :description, type: String
  field :content, type: String
  mount_uploader :podcast_ogg, AudioUploader
  mount_uploader :podcast_mp3, AudioUploader
  attr_accessor :picked_date

  before_save do |document|
    if document.picked_date
      break unless document.picked_date =~ /^(\d\d)\/(\d\d)\/(\d{4})$/
      year, month, day = $3.to_i, $2.to_i, $1.to_i

      time = Time.local year, month, day
      document[:date] = time
    end
  end
end
