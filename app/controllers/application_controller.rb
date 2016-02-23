class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  before_action :authenticate_user!
    
  def current_user
    @current_user
  end

  private
  
  def authenticate_user!
    authenticate_user(cookies.signed[:user_id]) || redirect_to(new_session_url)
  end
    
  def authenticate_user user_id
    @current_user = User.find_by id: user_id
    cookies.signed[:user_id] ||= user_id if @current_user
  end

  def render_validation errors
    flash.now[:error] = errors.full_messages.join('\n')
    render template: 'shared/render_validations'
  end
end
