class ApplicationController < ActionController::Base
  protect_from_forgery
  rescue_from ActiveRecord::RecordNotUnique, :with => :duplicate_entry
  
  helper_method :current_user
  
  before_filter :set_current_user
  
  layout :detect_browser

  protected
  
  MOBILE_BROWSERS = ["android", "ipod", "opera mini", "blackberry", "palm","hiptop","avantgo","plucker", "xiino","blazer","elaine", "windows ce; ppc;", "windows ce; smartphone;","windows ce; iemobile", "up.browser","up.link","mmp","symbian","smartphone", "midp","wap","vodafone","o2","pocket","kindle", "mobile","pda","psp","treo"]
  
  def detect_browser
    agent = request.headers["HTTP_USER_AGENT"].downcase
    puts "agent is " + agent.to_s
    MOBILE_BROWSERS.each do |m|
      return "mobile_application" if agent.match(m)
    end
    
    return "application"
  end
  
  def duplicate_entry
    flash[:error] = "You have already submitted a response for that question. Please choose another question."
    redirect_back_or_default(users_path)
  end

  def permission_denied    
    flash[:error] = "Sorry, you are not allowed to access that page."
    redirect_back_or_default(root_url)
  end
  
  def set_current_user
    Authorization.current_user = current_user
  end
    
  def current_user_session
    return @current_user_session if defined?(@current_user_session)    
    @current_user_session = UserSession.find
  end
  
  def current_user    
    return @current_user if defined?(@current_user)    
    @current_user = current_user_session && current_user_session.record
  end
  
  def redirect_back_or_default(default)
    redirect_to(:back || default)
  end
  
  def flash_and_form_errors
    
  end
end