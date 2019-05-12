require 'date'

class ListingsController < ApplicationController
  load_and_authorize_resource
  def index
    @listings = Listing.all
    @google_url = "https://maps.googleapis.com/maps/api/staticmap?center=Victoria+AustraliaY&zoom=7&size=600x300&maptype=hybrid"
    @marker_type = "&markers=color:red%7Clabel:C%7C"
    @listings.each do |listing|
      if listing.longitude != nil
        @google_url += @marker_type + "#{listing.latitude}, #{listing.longitude}"
      end
    end
    @google_url += "&key=AIzaSyAbwvRHfurzw-GOdhu3Fg1ohq5t8GyS1P0"
  end

  def search
    @listings = Listing.all
    @cost = search_params[:cost].to_i
    @start_time = search_params[:start_time].to_date
    @end_time = search_params[:end_time].to_date
    @location = search_params[:location]
    @radius = search_params[:radius].to_i
    @result_count = 0
    

    #all get all bookings from listing
    @bookings_unavailable = []
    @bookings_available = []
    @bookings_array = []

    @listings.each do |listing|
      @bookings = listing.bookings
      if @bookings.empty? == true
        @bookings_available << listing
      elsif @bookings.empty? == false
        @bookings.each do |booking|
          if booking.start_time && booking.end_time == nil
            @bookings_available << booking.listing
          else
            @bookings_array = (booking.start_time.to_date..booking.end_time.to_date).to_a
            @bookings_array.each do |booking_array|
              if booking_array===@start_time || @end_time
                unless @bookings_unavailable.include?booking.listing
                  @bookings_unavailable << booking.listing 
                end
              else 
                unless @bookings_available.include?booking.listing
                  @bookings_available << booking.listing
                end
              end
            end
          end
        end
      end
    end

    @filtered_listings = @bookings_available.map do |booking|
      if booking.distance_from(@location) < @radius
        if booking.cost.to_i < @cost
          booking
        end
      end
    end
      
    # google static map

    @google_url = "https://maps.googleapis.com/maps/api/staticmap?size=600x300&maptype=hybrid"
    @marker_type = "&markers=color:red%7Clabel:C%7C"
    @filtered_listings.each do |listing|
      if listing != nil
        @google_url += @marker_type + "#{listing.latitude}, #{listing.longitude}"
        @result_count +=1
      end
    end    
    @google_url += "&key=AIzaSyAbwvRHfurzw-GOdhu3Fg1ohq5t8GyS1P0"

  end


  
  def create
    @location = create_location
    @listing = Listing.new(listing_params)
    @listing.update_attribute(:location, @location)
    @listing.user_id = current_user.id
    if @listing.save
      redirect_to @listing
      flash[:notice] = "Listing successfully created."
    else
      redirect_to :root
      flash[:notice] = "An error has occured."
    end
  end



  def create_listing
  end

  def show
    @listing = Listing.find(params[:id])
    @user_id = @listing.user_id
    @listing_user = User.find(@user_id)
    @bookings = @listing.bookings
    @user = current_user
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
    @location = create_location
    @listing.update_attribute(:location, @location)
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

  def create_location
    @location_array =[]
    @location_array << location_params[:street]
    @location_array << location_params[:city]
    @location_array << location_params[:postcode]
    @location_array << location_params[:country]
    @location = @location_array.join(", ")
    return @location
  end

  def listing_params
    params.permit(:latitude, :longitude, :title, :description, :cost, :bathroom_availability, :laundry_availability, :electricity_availability, :kitchen_availability, uploaded_images: [])
  end

  def search_params
    params.permit(:cost, :start_time, :end_time, :location, :radius)
  end

  def location_params
    params.permit(:street, :city, :postcode, :country)
  end

end
