class CarsController < ApplicationController
  def index
    @cars = Car.all
  end

  def new
    @car = Car.new
  end

  def create
  end

  def show
  end

  def update
  end

  def edit
  end

  private

  def car_params
  end
end
