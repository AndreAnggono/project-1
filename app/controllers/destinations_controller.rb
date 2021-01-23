class DestinationsController < ApplicationController
  def new
  end

  def index
    @destination = params[:destination].downcase
  end
end
