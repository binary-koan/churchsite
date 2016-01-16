class NewsItem
  include Mongoid::Document

  belongs_to :owner, class_name: "NewsItem"
  has_many :related, class_name: "NewsItem", inverse_of: "owner"

  field :title, type: String
  field :content, type: String
  field :date, type: Time, default: -> { Time.now }

  attr_accessor :picked_date
  attr_accessor :repeat_type
  attr_accessor :repeat_until

  before_save do |document|
    if document.picked_date
      document[:date] = Chronic.parse(document.picked_date, endian_precedence: :little)
    end

    if document.repeat_type
      document.owner = document

      setup_repeated_items(document)
    end
  end

  private

  def setup_repeated_items(document)
    case document.repeat_type
    when "weekly"
      date = document[:date]
      end_date = Chronic.parse(document.repeat_until)
      loop do
        date = date + 7.days
        break if date > end_date
        create_repeated_item(document, date)
      end
    when "monthly"
      date = document[:date]
      end_date = document.repeat_until
      loop do
        date = date + 1.month
        break if date > end_date
        create_repeated_item(document, date)
      end
    end
  end

  def create_repeated_item(document, date)
    news_item = document.clone
    news_item.date = date
    news_item.owner = document
    news_item.save
  end
end
