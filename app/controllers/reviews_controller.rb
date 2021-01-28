class ReviewsController < ApplicationController
  before_action :check_for_login, :check_for_destination

  def new
      @review = Review.new
      @destination = Destination.find(session[:destination_id])
  end

  def create
    @review = Review.new
    date_of_exp = params[:review][:date_of_experience].to_date
    @existing_review = Review.where(:user_id => @current_user.id, :destination_id => session[:destination_id], :date_of_experience => date_of_exp.beginning_of_day..date_of_exp.end_of_day)

    unless @existing_review.present?
      @review.update review_params
      @review.update :destination_id => session[:destination_id], :user_id => @current_user.id

      if @review.save
        redirect_to destination_path(session[:destination_id])
      else
        render :new
      end
    else
      render :new
    end
  end

  def edit
    # To prevent users editing other user's reviews
    if @current_user.id == Review.find(params[:id]).user.id
      @review = Review.find(params[:id])
    else
      redirect_to root_path
    end
  end

  def update
    review = Review.find(params[:id])
    review.update review_params
    redirect_to destination_path(session[:destination_id])
  end

  def destroy
    # To prevent users deleting other users reviews
    if @current_user.id == Review.find(params[:id]).user.id
      review = Review.find(params[:id])
      review.destroy
    end
    redirect_to destination_path(session[:destination_id])
  end

  def like
    raise 'hell'
  end

  private
  def review_params
    params.require(:review).permit(:rating, :date_of_experience, :description)
  end

  def check_for_destination
    redirect_to root_path unless session[:destination_id].present?
  end
end
