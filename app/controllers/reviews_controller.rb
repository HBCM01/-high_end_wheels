class ReviewsController < ApplicationController
  def new
    @review = Review.new
    @booking = Booking.find(params[:booking_id])
  end

  def create
    @review = Review.new(review_params)
    @booking = Booking.find(params[:booking_id])
    @review.booking = @booking
    if @review.save
      redirect_to my_profile_path
    else
      flash[:alert] = @review.errors.messages
      render :new
    end
  end
    #  def create
    # @booking = Booking.new(booking_params)
    # @booking.user = current_user
    # @car = Car.find(params[:car_id])
    # @booking.car = @car
    # if @booking.save
    #   redirect_to my_profile_path
    # else
    #   render :new
    # end

  private

  def review_params
    params.require(:review).permit(:description, :rating)
  end
end
