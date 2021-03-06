class ApplicationController < ActionController::Base

  def forem_user
    current_user
  end
  helper_method :forem_user

  def forem_avatar
    user.avatar
  end
  helper_method :forem_avatar

  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  before_action :authenticate_user!

  def require_admin
    unless current_user.admin
      redirect_to root_path
    end
  end

end
