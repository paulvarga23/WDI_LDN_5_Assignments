class CarsController < ApplicationController

  def index
    @cars = Car.all
  end

  def new
    @car = Car.create
  end

  def create
    @car = Car.new(params[:car])
    redirect_to(cars_path)
  end

  def show
    @car = Car.find(params[:id])
  end

  def edit
    @car = Car.find(params[:id])
    @engines = Engine.all
  end

  def update
    @car = Car.find(params[:id])
    @car.update_attributes(params[:car])
    redirect_to cars_path
  end

  def destroy
    car = Car.find(params[:id])
    car.destroy
    redirect_to(cars_path)
  end

end