class BookingsController < ApplicationController
  def new

    @item = Property.find(params[:item_id])
    @booking = Booking.new
  end

  def create
    @item = Iem.find(params[:item_id])
    @booking = @item.bookings.build(params[:booking])
    if @booking.save
      flash[:success] = "Booking created"
      redirect_to [@item, @booking]
    else
      render 'new'
    end
end
end
