class BookingsController < ApplicationController
  def index
   @bookings = Booking.all
  end

  def new
    p '10101010' * 100
    p params[:item_id]
    @item = Item.find(params[:item_id])
    # @booking = @item.bookings.build
  end

  def create
    p '1' * 100
    p booking_params
    p 'idididididididid' + params[:item_id]
    @item = Item.find(params[:item_id])
    @booking = Booking.new(booking_params)

    @booking.renter = current_user
     if @booking.save

       flash[:success] = "Booking created"
       redirect_to items_path
     else
       p @booking.errors
       render 'new'
    end
  end

  def show
    @bookings = @item.bookings
  end

  def booking_params
    params.require(:booking).permit(:rent_start, :rent_end, :item_id)
  end
end
