class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  # prepend_before_filter :find_current_user
  after_filter :set_csrf_cookie_for_ng

  protect_from_forgery with: :exception


  def index
  end
    
  def set_csrf_cookie_for_ng
    cookies['XSRF-TOKEN'] = form_authenticity_token if protect_against_forgery?
  end

  def find_current_user
  	@current_user = current_user.present? ? current_user : nil
  end	

  protected
  def verified_request?
    super || form_authenticity_token == request.headers['X-XSRF-TOKEN']
  end
end
