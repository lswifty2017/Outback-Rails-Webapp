class ListingsController < ApplicationController
  def index
    @listings = Listing.all
  end
  
  def create
    @listing = Listing.new(listing_params)
    @listing.save
    redirect_to @listing

    # @user = User.find(params[:user_id])
    # if @listing = @user.listings.create(listing_params)
    #   @listing.save
    #   @user = current_user
    # end
    
    # redirect_to listings_path
  end

  def show
    @listing = Listing.find(params[:id])
  end

  def edit
    @listing = Listing.find(params[:id])
  end

  def update
    @listing = Listing.find(params[:id])
    if @listing.update(listing_params)
      flash[:notice] = "Restaurant successfully updated"
      redirect_to @listing
    else
      render 'index'
    end
  end

  def destroy
    @listing = Listing.find(params[:id])
    @listing.destroy
    redirect_to listings_path
  end

  private
  def listing_params
    params.permit(:title, :location, :description, :cost)
  end
end
