class ListingsController < ApplicationController
  def index
    @listings = Listing.all
  end
  
  def create
    @listing = Listing.new(listing_params)
    @listing.user_id = current_user.id
    @listing.uploaded_images = params["uploaded_images"]
    if @listing.save
      redirect_to @listing
    else
      redirect_to :root
    end
  end

  def show
    @listing = Listing.find(params[:id])
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

  private
  def listing_params
    params.permit(:title, :location, :description, :cost, uploaded_images: [])
  end
end
