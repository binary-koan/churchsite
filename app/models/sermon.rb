class Sermon
  include Mongoid::Document
  field :date, type: Date, default: Date.today
  field :title, type: String
  field :description, type: String
  field :content, type: String
  mount_uploader :podcast_ogg, AudioUploader
  mount_uploader :podcast_mp3, AudioUploader
  attr_accessor :picked_date

  def pretty_description(compact = false)
    desc = description
    desc = desc[0..100] + '...' if compact and desc.length > 100
    '<p>' + desc.split(/\n|\r\n?/).join('</p><p>') + '</p>'
  end

  before_save do |document|
    if document.picked_date
      document[:date] = Chronic.parse(document.picked_date, endian_precedence: :little, context: :past).to_date
    end
  end
end
