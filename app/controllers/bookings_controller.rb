class BookingsController < ApplicationController
  def new
    @booking = Booking.new
    @car = Car.find(params[:car_id])
  end

  def create
    @booking = Booking.new(booking_params)
    @booking.user = current_user
    @car = Car.find(params[:car_id])
    @booking.car = @car
    if @booking.save
      redirect_to my_profile_path
    else
      render :new
    end
  end

  def show
    @booking = Booking.find(params[:id])
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
