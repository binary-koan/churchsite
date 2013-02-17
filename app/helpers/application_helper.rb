module ApplicationHelper
  #TODO: Should this check for tablets as well?
  def mobile_device?
    if session[:mobile_param]
      session[:mobile_param] == "1"
    else
      request.user_agent =~ /Mobile|webOS/
    end
  end

  def phone_url(number)
    if mobile_device?
      "tel://" + number.gsub(/\s+/, '-').sub(/^\+/, '')
    else
      "callto://" + number.gsub(/\s+/, '')
    end
  end

  def cp(path)
    "active" if current_page?(path)
  end
end
