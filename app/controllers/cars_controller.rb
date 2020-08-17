class CarsController < ApplicationController
  # before_action :find_user
  def index
    @cars = Car.all
  end

  def new
    @user = User.find(params[:id])
    @car = Car.new(@user)
  end

  def create
    @car = Car.new(car_params)
    @user = User.find(params[:user_id])
    @car.user = @user
    if @car.save
      redirect_to user_cars_path
    else
      flash[:alert] = @car.error.messages
      redirect_to new_user_car_path_path
    end
  end

  def show
  end

  def update
  end

  def edit
  end

  private

  def find_user
    @user = User.find(params[:id])
  end

  def car_params
    params.require(:car).permit(:make, :model, :price, :address, :user_id)
  end
end
