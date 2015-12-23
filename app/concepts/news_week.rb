class NewsWeek
  def initialize(date)
    @date = date.to_date
  end

  def items
    @items ||= generate_items
  end

  def title
    this_monday = Chronic.parse("last monday")
    week_monday = Chronic.parse("last monday", now: @date)

    if week_monday == this_monday
      "This week"
    else
      "Week of #{week_monday.strftime("%-d %b %Y")}"
    end
  end

  private

  def generate_items
    date, end_date = week_of(@date)

    items = date.step(end_date).map do |current_date|
      items = NewsItem.and({ :date.gte => current_date }, { :date.lt => current_date + 1.day })
      next unless items.count > 0

      {
        date: current_date,
        #TODO move this to a helper or view
        title: current_date.strftime('%A %-d'),
        highlight: current_date == @date,
        items: items
      }
    end.compact
  end

  def week_of(date)
    start_date = Chronic.parse("last monday", now: date).to_date
    [start_date, start_date + 7.days]
  end
end
