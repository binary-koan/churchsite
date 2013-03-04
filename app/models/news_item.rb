class NewsItem
  include Mongoid::Document
  field :title, type: String
  field :content, type: String
  field :date, type: Date
  
  before_save do |document|
    if document[:'date(1i)']
      document.date = Date.new document[:'date(1i)'].to_i, document[:'date(2i)'].to_i, document[:'date(3i)'].to_i
    elsif not document.date
      document.date = Date.today
    end
  end
end
