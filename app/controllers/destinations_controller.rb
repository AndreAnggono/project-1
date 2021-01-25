class DestinationsController < ApplicationController
  def new
  end

  def index
  end

  def show
    @destination = Destination.find(params[:id])
    session[:destination_id] = @destination.id
  end

  def search
    @query = params[:q].downcase
    @destinations = Destination.where("name LIKE ?", "%#{@query}%")
  end

end
