require 'image_uploader'

class Option
  include Mongoid::Document
  include Mongoid::Timestamps::Updated

  field :news_announcement, type: String

  field :title, type: String, default: "Our Parish"
  field :church_type, type: String
  field :tagline, type: String, default: "Something catchy or just descriptive"
  field :about_page, type: String

  field :leader_title, type: String
  field :leader_name, type: String
  field :leader_phone, type: String
  field :leader_email, type: String
  field :leader_address, type: String
  mount_uploader :leader_image, ImageUploader
  mount_uploader :banner_image, ImageUploader
  mount_uploader :vertical_banner_image, ImageUploader

  field :leader_use_email, type: Boolean, default: true
  field :leader_use_phone, type: Boolean, default: true
  field :leader_use_address, type: Boolean, default: true
  alias_method :leader_use_email?, :leader_use_email
  alias_method :leader_use_phone?, :leader_use_phone
  alias_method :leader_use_address?, :leader_use_address

  def self.instance
    @instance ||= first || create!
  end
end
