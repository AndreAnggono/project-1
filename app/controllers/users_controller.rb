class UsersController < ApplicationController
  def new
    # To prevent users already logged in to access sign up page directly
    unless @current_user.present?
      @user = User.new
    else
      redirect_to root_path
    end
  end

  def create
    @user = User.new user_params

    if @user.save
      session[:user_id] = @user.id
      redirect_to root_path
    else
      render :new
    end
  end

  def show
    @user = User.find(params[:id])
  end

  def edit
    # To prevent users editing other user profiles
    if @current_user.id == params[:id].to_i
      @user = User.find(params[:id])
    else
      redirect_to edit_user_path(@current_user.id)
    end
  end

  def update
    user = User.find(params[:id])

    if user.update user_params
       redirect_to user_path
    else
      flash[:errors] = user.errors
      redirect_to edit_user_path
    end
  end

  def destroy
    # To prevent rogue post delete request and only allow the actual user to delete their profile
    if @current_user.id == params[:id].to_i
      user = User.find(params[:id])
      user.destroy
      session[:destination_id] = nil
    end
    redirect_to root_path
  end

  private
  def user_params
    params.require(:user).permit(:username, :avatar, :first_name, :last_name, :email, :city, :password, :password_confirmation)
  end
end
