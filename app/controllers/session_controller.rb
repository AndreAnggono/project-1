class SessionController < ApplicationController
  def new
  end

  def create
    user = User.find_by :username => params[:username]
  
    if user.present? && user.authenticate(params[:password])
      session[:user_id] = user.id

      if session[:destination_id].present?
        redirect_to new_review_path
      else
        redirect_to root_path
      end
    else
      flash[:error] = "Invalid username or password"
      redirect_to login_path
    end
  end

  def destroy
    session[:user_id] = nil
    session[:destination_id] = nil
    redirect_to root_path
  end
end
