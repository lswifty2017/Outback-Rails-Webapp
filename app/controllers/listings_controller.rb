class ListingsController < ApplicationController
  def index
    @listings = Listing.all
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
end
