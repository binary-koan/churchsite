class NewsItem
  include Mongoid::Document

  field :title, type: String
  field :content, type: String
  field :owner, type: Moped::BSON::ObjectId
  attr_accessor :picked_date#, type: String, default: -> { Time.now.strftime('%d/%m/%Y') }
  attr_accessor :picked_time#, type: String

  field :date, type: Time, default: -> { Time.now }
  # Examples:
  #  repeat_type = 'Every Week' - every Monday, Tuesday, ...
  #  repeat_type = 'Every Month' - 1st of every month, ...
  #  repeat_type = 'Every Month (weekday)' - 1st Monday of every month, ...
  #attr_accessor :repeat_type
  #attr_accessor :repeat_until

  before_save do |document|
    if document.picked_date
      break unless document.picked_date =~ /^(\d\d)\/(\d\d)\/(\d{4})$/
      year, month, day = $3.to_i, $2.to_i, $1.to_i
      break unless document.picked_time =~ /^(\d\d):(\d\d) (AM|PM)$/
      hour, minute = $1.to_i, $2.to_i
      if $3 == 'PM'
        hour = hour == 12 ? 12 : hour + 12
      else
        hour = hour == 12 ? 0 : hour
      end

      time = Time.local year, month, day, hour, minute
      document[:date] = time
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
    #  when "Monthly (weekday)"
    #    date = document[:date]
    #    end_date = document.repeat_until
    #    loop do
    #      date = date + 7.days
    #      break if date > end_date
    #      repeat date
    #    end
    #end
  end

  def repeat(date)
    news_item = self.clone
    news_item.date = date
    news_item.owner = self._id
    news_item.save
  end
end
