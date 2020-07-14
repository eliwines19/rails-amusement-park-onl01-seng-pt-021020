class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  helper_methods :logged_in?, :current_user, :admin_only

  def logged_in?
    !!current_user
  end

  def current_user
    current_user ||= User.find_by(id: session[:user_id]) if session[:user_id]
  end

  def admin_only
    if !current_user.admin
      redirect_to root_path, notice: "You do not have permission to view this page"
    end
  end

  private

  def require_login
    redirect_to root_path unless session.include? :user_id
  end

end
