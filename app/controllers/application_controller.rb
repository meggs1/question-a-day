class ApplicationController < ActionController::Base
  helper_method :current_user, :logged_in?, :invalid_user
  rescue_from ActiveRecord::RecordNotFound, with: :record_not_found

  private

  def current_user
    if session[:user_id].present?
      user = User.find_by(:id => session[:user_id])
    end
  end

  def logged_in?
    !!current_user
  end

  def record_not_found
    flash[:danger] = "That page doesn't exist."
    redirect_to root_path
  end

  def invalid_user
    flash[:danger] = "You don't have access to view that!"
    redirect_to root_path
  end

end
