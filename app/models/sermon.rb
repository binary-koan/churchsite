class Sermon
  include Mongoid::Document
  field :date, type: Date, default: Date.today
  field :title, type: String
  field :description, type: String
  field :content, type: String
  # mount_uploader :podcast_ogg, AudioUploader
  mount_uploader :podcast_mp3, AudioUploader
  attr_accessor :picked_date

  #TODO move out of model layer
  def formatted_description
    CGI.escapeHTML(description).split(/\n|\r\n?/).join("<br />").html_safe
  end

  before_validation do |document|
    if document.picked_date
      document[:date] = Chronic.parse(document.picked_date, endian_precedence: :little, context: :past)&.to_date
    end

    errors.add(:date, "is not a date") unless document[:date]
  end
end
