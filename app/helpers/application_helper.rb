module ApplicationHelper
  def editing?
    user_signed_in? && session[:editing]
  end

  def phone_url(number)
    if mobile_device?
      "tel://" + number.gsub(/\s+/, '-').sub(/^\+/, '')
    else
      "callto://" + number.gsub(/\s+/, '')
    end
  end

  # Very simple breadcrumb generator
  # trail: Hash
  # eg
  #   breadcrumb('First bit' => first_path, 'Second bit' => second_path, 'Current page' => nil)
  def breadcrumb(trail)
    fragments = trail.each.map do |title, href|
      "<a href='#{href}'>#{title} <span class='glyphicon glyphicon-menu-right'></span></a>"
    end

    "<div class='breadcrumbs'>#{fragments.join(" ")}</div>".html_safe
  end

  private

  #TODO: Should this check for tablets as well?
  def mobile_device?
    if session[:mobile_param]
      session[:mobile_param] == "1"
    else
      request.user_agent =~ /Mobile|webOS/
    end
  end
end
