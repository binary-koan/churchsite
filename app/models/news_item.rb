class NewsItem
  include Mongoid::Document
  field :title, type: String
  field :content, type: String
  field :date, type: Date
  
  before_save do |document|
    document.date = Date.today unless document.date
  end
end
