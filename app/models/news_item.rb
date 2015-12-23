class NewsItem
  include Mongoid::Document

  field :title, type: String
  field :content, type: String
  field :owner, type: BSON::ObjectId
  field :date, type: Time, default: -> { Time.now }

  attr_accessor :picked_date
  #attr_accessor :repeat_type
  #attr_accessor :repeat_until

  before_save do |document|
    if document.picked_date
      document[:date] = Chronic.parse document.picked_date, endian_precedence: :little
    end

    #case document.repeat_type
    #  when "Weekly"
    #    date = document[:date]
    #    end_date = document.repeat_until
    #    loop do
    #      date = date + 7.days
    #      break if date > end_date
    #      repeat date
    #    end
    #  when "Monthly"
    #    date = document[:date]
    #    end_date = document.repeat_until
    #    loop do
    #      date = date + 7.days
    #      break if date > end_date
    #      repeat date
    #    end
    #end
  end

  private

  def create_repeated_item(date)
    news_item = self.clone
    news_item.date = date
    news_item.owner = self._id
    news_item.save
  end
end
