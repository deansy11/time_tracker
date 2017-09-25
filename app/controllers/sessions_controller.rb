class SessionsController < ApplicationController
  def index

  end

  def new
  end

  def create
    developer = Developer.find_by_email(params[:email])

    if @developer && developer.authenticate(params[:password_digest])
      session[:developer_id] = developer.id
      redirect_to developers_path
    else
      redirect_to new_session_path
    end
  end

  def destroy
    session[:developer_id] = nil
    redirect_to new_session_path
  end

end
