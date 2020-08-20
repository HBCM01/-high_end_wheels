class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: :home
  def home
  end

  def my_profile
    @pending_bookings = current_user.bookings.where(status: false)
    @confirmed_bookings = current_user.bookings.where(status: true)
  end

  def my_booking_requests
    @cars = current_user.cars
    @bookings = []
    @cars.each do |car|
      @bookings << car.bookings
    end
  end
end
