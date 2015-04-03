class CommunityPage
  include Mongoid::Document
  field :title, type: String
  field :content, type: String
  field :identifier, type: String
  field :order, type: Integer, default: 0

  before_save do |document|
    document.identifier = Rack::Utils.escape document.title.downcase.gsub(/[\s+]/, '_').gsub(/[^A-Za-z0-9_]+/, '')
  end
end
