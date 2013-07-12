class CommunityPage
  include Mongoid::Document
  field :title, type: String
  field :content, type: String
  field :identifier, type: String

  before_save do |document|
    document.identifier = Rack::Utils.escape document.title.downcase.gsub(/\s+/, '_')
  end
end
