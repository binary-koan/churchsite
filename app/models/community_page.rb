class CommunityPage
  include Mongoid::Document
  field :title, type: String
  field :content, type: String
  field :identifier, type: String
  field :order, type: Integer, default: 0

  before_save do |document|
    document.identifier ||= document.title.parameterize
  end
end
