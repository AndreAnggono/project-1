class DestinationsController < ApplicationController
  def new
  end

  def create
    destination = Destination.new destination_params
  
    if destination.save
      redirect_to destination_path(destination)
    else
      redirect_to root_path
    end   
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

    # Checking whether the current RATING value is up to date. If not, update it. If it is, skip.
    @destination.update :rating => avg_rating unless @destination.rating == avg_rating

    session[:destination_id] = @destination.id
  end

  def search
    @query = params[:q].downcase
    @destinations = Destination.where("name LIKE ?", "%#{@query}%")
    
    @result = query_api(@query)
    
    @result = @result.select { |r|
      !Destination.where(:name => r[:name], :address => r[:address], :latitude => r[:latitude], :longitude => r[:longitude] ).exists?
    }
  end

  private
  def destination_params
    params.require(:destination).permit(:name, :address, :latitude, :longitude)
  end

  def query_api(search_value)
    query = Geocoder.search(search_value).select{|destination| destination.country == "Australia" }
    report = []

    query.each { |result| 
      tmp = result.address.split(', ')
      name = tmp.first
      address = tmp.slice(1..).join(', ')
      lat = result.latitude
      lon = result.longitude
      report << {:name => name.downcase, :address => address, :latitude => lat, :longitude => lon}
    }
    report
  end
end
