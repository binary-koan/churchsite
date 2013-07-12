module NewsItemsHelper
  def new_item
    item = NewsItem.new
    item.picked_date = Time.now.strftime('%d/%m/%Y')
    item
  end

  def monday_before(date)
    wday = date.wday
    wday = 7 if wday == 0
    date - (wday - 1).days
  end

  # Range is start_date <= d < end_date
  def week_of(date)
    start_date = monday_before date
    end_date = start_date + 7.days
    [start_date, end_date]
  end

  # Returns an array of arrays - one for each day between start_date and end_date
  def news_items_from_week(date)
    news_items_from *week_of(date)
  end

  def news_items_from(start_date, end_date=nil)
    end_date = start_date + 10.years unless end_date
    raw_items = NewsItem.and({ :date.gte => start_date}, { :date.lt => end_date }).sort date: 1
    items = []

    raw_items.each do |news_item|
      index = (news_item.date - start_date).to_i / 60 / 60 / 24
      unless items[index]
        title = news_item.date.localtime.strftime('%A ') + news_item.date.localtime.day.ordinalize
        items[index] = { title: title, items: [] }
      end
      items[index][:items] << news_item
    end
    items.compact
  end

  def week_items_from(date)
    news_items = news_items_from_week date

    this_monday = monday_before Time.now
    date_monday = monday_before date
    if date_monday.yday == this_monday.yday and date_monday.year == this_monday.year
      news_title = "This Week"
    else
      news_title = "Week of " + monday_before(date).strftime("%-d %b %Y")
    end

    return news_items, news_title
  end
end
