class BookingsController < ApplicationController
  before_action :authenticate_user!
  before_action :find_booking, only: [:show, :edit, :update, :destroy]
  before_action :correct_user, only: [:show, :edit, :update, :destroy]

  def new
    @pet = Pet.find(params[:pet_id])
    @booking = Booking.new
  end

  def create
    @booking = Booking.new(booking_params)
    @pet = Pet.find(params[:pet_id])
    @booking.pet = @pet
    @booking.user = current_user
    if @booking.save
      redirect_to pet_booking_path(@pet, @booking)
    else
      render :new
    end
  end

  def show
    @pet = Pet.find(params[:pet_id])
    @review = Review.new
  end

  def edit
  end

  def update
    if @booking.update(booking_params)
      redirect_to pet_booking_path(@booking.pet, @booking)
    else
      render :edit
    end
  end

  def destroy
    @booking.destroy
    redirect_to my_bookings_path
  end

  def my_bookings
    @bookings = Booking.where(user: current_user)
  end

  private

  def find_booking
    @booking = Booking.find(params[:id])
  end



  def correct_user
    redirect_to root_path, alert: 'Not authorized' unless @booking.user == current_user
  end

  def booking_params
    params.require(:booking).permit(:start_date, :end_date)
  end
end
