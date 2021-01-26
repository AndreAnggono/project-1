class DestinationsController < ApplicationController
  def new
  end

  def index
  end

  def show
    @destination = Destination.find(params[:id])
 
    # Counting the average rating from all reviews
    if @destination.reviews.count.zero?
      avg_rating = 0.0
    else
      avg_rating = ((@destination.reviews.reduce(0) {|sum, review| sum + review.rating }) / @destination.reviews.count).round(2)
    end

    # Checking whether the current value is up to date. If not, update it. If it is, skip.
    @destination.update :rating => avg_rating unless @destination.rating == avg_rating

    session[:destination_id] = @destination.id
  end

  def search
    @query = params[:q].downcase
    @destinations = Destination.where("name LIKE ?", "%#{@query}%")
  end

end
