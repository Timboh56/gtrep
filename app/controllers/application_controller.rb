class ApplicationController < ActionController::Base
  protect_from_forgery
  rescue_from ActiveRecord::RecordNotUnique, :with => :duplicate_entry
  
  helper_method :current_user
  
  before_filter { |c| Authorization.current_user = c.current_user }

  protected
  
  def duplicate_entry
    flash[:error] = "You have already submitted a response for that question. Please choose another question."
    redirect_back_or_default(users_path)
  end

  def permission_denied
    flash[:error] = "Sorry, you are not allowed to access that page."
    redirect_back_or_default(users_path)
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