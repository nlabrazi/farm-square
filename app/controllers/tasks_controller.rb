class TasksController < ApplicationController

	def index
    @tasks = Task.all
    @farms = Farm.all
    @cities = City.all

    if params[:query].present?
      @tasks = @tasks.search_by_title(params[:query])
    else
      @tasks
    end

    if params[:order].present?
      @city = City.where(name:params[:order])
      @farm = Farm.where(city_id:@city.ids)
      @tasks = Task.where(farm_id:@farm.ids)
    else
      @tasks
    end

  end

  def show
    @task = Task.find(params[:id])
    @farm = Farm.find(@task.farm_id)
    @city = City.find(@farm.city_id)
  end

  def new
    @task = Task.new
  end

  def create
  	@task = Task.create(task_params)
  	if @task.save
      flash.notice = "Votre tâche a bien été créée"
      redirect_to root_path
    else
      flash.alert = "Une erreur est survenue #{@task.errors.messages}"
      redirect_to root_path
    end
  end

  def update
    @task = Task.find(params[:id])
    @task.update(task_params)
    if @task.save
      flash.notice = "Votre tâche a bien été modifiée"
      redirect_to root_path
    else
      flash.alert = "Une erreur est survenue #{@task.errors.messages}"
      redirect_to root_path
    end
  end

  def destroy
    @task = Task.find(params[:id])
    @bookings = Booking.where(task_id=@task)
    if @task.destroy && bookings.destroy
      flash.notice = "La tâche ainsi que tous les bookings correspondant ont bien été SUPPRIME"
      redirect_to root_path
    else
      flash.alert = "Une erreur est survenue #{@task.errors.messages} et #{@bookings.errors.messages}"
      redirect_to root_path
    end
  end


  private 

  def task_params
    params.require(:task).permit(:title,:description,:start_date,:end_date,:participant_number,:action_id,:farm_id)
  end

end