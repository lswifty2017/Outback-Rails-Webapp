class ListingsController < ApplicationController
  def index
    @listings = Listing.all
  end
  
  def create
    @listing = Listing.new(listing_params)
  end

  def show
    @listing = Listing.find(params[:id])
  end

  def edit
  end

  def destroy
  end

  private
  def listing_params
    params.permit(:title, :location, :description, :cost)
  end
end
