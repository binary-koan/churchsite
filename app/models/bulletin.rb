class Bulletin
  include Mongoid::Document
  include Mongoid::Timestamps::Created
  include Mongoid::Timestamps::Updated

  field :date, type: String
  mount_uploader :document, PdfUploader

  def self.latest
    order(created_at: :desc).first
  end

  def self.previous
    order(created_at: :desc).drop(1)
  end
end
