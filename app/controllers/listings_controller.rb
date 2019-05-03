class ListingsController < ApplicationController
  def index
    @listings = Listing.all
  end

  def search
    @listings = Listing.all
    @cost = search_params[:cost].to_i
    @start_time = search_params[:start_time]
    @end_time = search_params[:end_time]
    @filtered_listings_cost = @listings.map do |listing|
      if listing.cost.to_i < @cost
        listing
      end
    end 


    # @price_filter_results = @listings.price_filter(@price)
    # @price_filter_names = price_filter_results.map do |listing|
    #   listing.title
    # end
    # redirect_to listings_search_results_path
  end
  
  def create
    @listing = Listing.new(listing_params)
    @listing.user_id = current_user.id
    if @listing.save
      redirect_to @listing
    else
      redirect_to :root
    end
  end

  def show
    @listing = Listing.find(params[:id])
    @bookings = @listing.bookings
  end

  def show_user_listings
    @user = current_user
    @user_listings = @user.listings.all
  end

  def edit
    @listing = Listing.find(params[:id])
  end

  def update
    @listing = Listing.find(params[:id])
    if @listing.update(listing_params)
      flash[:notice] = "Listing successfully updated"
      redirect_to @listing
    else
      render 'index'
    end
  end

  def destroy
    @listing = Listing.find(params[:id])
    @listing.destroy
    flash[:notice] = "Listing successfully deleted"
    redirect_to listings_path
  end

  def destroy_uploaded_images
    @listing = Listing.find(params[:id])
    @uploaded_images = @listing.uploaded_images
    @uploaded_images.purge
    flash[:notice] = "Images successfully deleted"
    @listing.save
    redirect_to @listing
  end

  private
  def listing_params
    params.permit(:title, :location, :description, :cost, uploaded_images: [])
  end

  def search_params
    params.permit(:cost, :start_time, :end_time)
  end
end
