class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  def current_user
    @current_user ||= User.find(session[:user_id]) if session[:user_id]
  end
  helper_method :current_user

  def ensure_logged_in
    unless current_user
      flash[:alert] = "Please log in"
      redirect_to new_session_url
    end
  end

  def ensure_owner
    @picture = Picture.find(params[:id])
    unless current_user.id == @picture.user_id
      flash[:alert] = "You cannot make changes to this image"
      redirect_to show_picture_url
    end
  end

end
