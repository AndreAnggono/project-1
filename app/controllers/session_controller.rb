class SessionController < ApplicationController
  def new
  end

  def create
    user = User.find_by :username => params[:username]
    
    if user.present? && user.authenticate(params[:password])
      session[:user_id] = user.id
      
      # Redirecting traffic to original request when request is interrupted by login page
      if session[:destination_path].present?
        original_path = session[:destination_path]
        session[:destination_path] = nil
        redirect_to original_path
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

  def omniauth
    user = User.create_from_omniauth(auth)
    
    if user.valid?
      session[:user_id] = user.id
      redirect_to root_path
    else
      raise 'hell'
      # redirect_to
    end
  end

  private
  def auth
    request.env['omniauth.auth']
  end
end