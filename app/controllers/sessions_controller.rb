class SessionsController < Devise::SessionsController
  before_action :redirect_to_secure_site, :only => :new

  protected

  def redirect_to_secure_site
    if Churchsite::SECURE_SITE_DOMAIN && request.host != Churchsite::SECURE_SITE_DOMAIN
      redirect_to "https://#{Churchsite::SECURE_SITE_DOMAIN}#{request.fullpath}"
    end
  end
end
