class ListingsController < ApplicationController
  def index
    @listings = Listing.all
  end
  
  def create
    @listing = Listing.new(listing_params)

    # @user = User.find(params[:user_id])
    # if @listing = @user.listings.create(listing_params)
    #   @listing.save
    #   @user = current_user
    #   RestaurantMailer.with(user: @user).new_review_email.deliver_now
    # end
    
    # redirect_to listings_path
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
