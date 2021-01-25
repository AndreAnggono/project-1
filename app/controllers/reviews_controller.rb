class ReviewsController < ApplicationController
  before_action :check_for_login, :check_for_destination

  def new
      @review = Review.new
      @destination = Destination.find(session[:destination_id])
  end

  def create
    @review = Review.new review_params
    @review.update :destination_id => session[:destination_id], :user_id => @current_user.id
    @review.save
    redirect_to destination_path(session[:destination_id])
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

  private
  def review_params
    params.require(:review).permit(:rating, :date_of_experience, :description)
  end

  def check_for_destination
    redirect_to root_path unless session[:destination_id].present?
  end
end
