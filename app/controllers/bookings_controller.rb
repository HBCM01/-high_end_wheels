class BookingsController < ApplicationController
  def new
    @booking = Booking.new
    @car = Car.find(params[:car_id])
  end

  def create
    @booking = Booking.new(booking_params)
    @booking.user = current_user
    @booking.car_id = params(:car_id)
    if @booking.save
      redirect_to @booking
    else
      render :new
    end
  end

  def destroy
    @booking = Booking.find(params[:id])
    @booking.destroy
    redirect_to bookings_path
  end

  private

  def booking_params
    params.require(:booking).permit(:start_date, :end_date)
  end

end
# :show, :new, :create, :update, :edit, :destroy
# in pages controller we can retreive all bookings belonging to a specific user