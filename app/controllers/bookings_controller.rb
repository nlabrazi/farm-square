class BookingsController < ApplicationController

	def index
    @bookings = Booking.all
    @tasks = Task.all
    @farms = Farm.all
    @cities = City.all
  end

  def show
  	@booking = Booking.find(params[:id])
    @task = Task.find(@booking.task_id)
    @farm = Farm.find(@task.farm_id)
    @city = City.find(@farm.city_id)
  end

  def new
    @booking = Booking.new
  end

  def create
  	@booking = Booking.create(booking_params)
  	@booking.user_id = current_user
  	if @booking.save
      flash.notice = "Votre tâche a bien été créée"
      redirect_to root_path
    else
      flash.alert = "Une erreur est survenue #{@booking.errors.messages}"
      redirect_to root_path
    end
  end

  def update
  end

  def destroy
    @booking = Booking.find(params[:id])
    if booking.destroy
      flash.notice = "Le booking correspondant ont bien été SUPPRIME"
      redirect_to root_path
    else
      flash.alert = "Une erreur est survenue #{@booking.errors.messages}"
      redirect_to root_path
    end
  end


  private 

  def booking_params
    params.require(:booking).permit(:task_id)
  end

end
