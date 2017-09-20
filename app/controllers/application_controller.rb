class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  private

  def current_developer
    @current_developer ||= Developer.find(session[:developer_id]) if session[:developer_id]
  end

  helper_method :current_developer

  def authenticate_developer!
    redirect_to new_developer_path unless current_developer
  end
end
