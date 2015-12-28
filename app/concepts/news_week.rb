class NewsWeek
  def initialize(date)
    @date = date.to_date
  end

  def items
    @items ||= generate_items
  end

  def title
    this_monday = Date.today.beginning_of_week

    if week_start == this_monday
      "This week"
    else
      "Week of #{week_monday.strftime("%-d %b %Y")}"
    end
  end

  private

  def generate_items
    items = week_start.step(week_end).map do |current_date|
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

  def week_start
    @date.to_date.beginning_of_week
  end

  def week_end
    week_start + 7.days
  end
end
