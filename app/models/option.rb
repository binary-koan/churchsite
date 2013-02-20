require 'image_uploader'

class Option
  include Mongoid::Document

  field :use_news, type: Boolean, default: true
  field :use_community, type: Boolean, default: true
  field :use_about, type: Boolean, default: true
  field :use_photos, type: Boolean, default: true
  field :use_sermons, type: Boolean, default: true
  alias_method :use_news?, :use_news
  alias_method :use_community?, :use_community
  alias_method :use_about?, :use_about
  alias_method :use_sermons?, :use_sermons
  alias_method :use_photos?, :use_photos

  field :news_name, type: String, default: "News"
  field :community_name, type: String, default: "Activities"
  field :about_name, type: String, default: "About"
  field :photos_name, type: String, default: "Photos"
  field :sermons_name, type: String, default: "From the Minister"

  field :title, type: String, default: "Our Parish"
  field :church_type, type: String
  field :tagline, type: String, default: "Something catchy or just descriptive"
  field :about_page, type: String

  field :leader_title, type: String
  field :leader_name, type: String
  field :leader_phone, type: String

  field :leader_use_email, type: Boolean, default: true
  field :leader_use_phone, type: Boolean, default: true
  field :leader_use_address, type: Boolean, default: true
  alias_method :leader_use_email?, :leader_use_email
  alias_method :leader_use_phone?, :leader_use_phone
  alias_method :leader_use_address?, :leader_use_address

  field :leader_email, type: String
  field :leader_address, type: String
  mount_uploader :leader_image, ImageUploader
end
