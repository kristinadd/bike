class CitiesController < ApplicationController
  before_action :authenticate_user!
  def index
    @cities = City.all.order("created_at DESC")
  end

  def new
    @city = City.new
  end

  def create
    @city = City.new(city_params)
    if @city.save
      @city.add_flag_to_name
      CityDescriptionJob.perform_async(@city.id)   # the perform_async method returns id of the job
      CityImageJob.perform_async(@city.name)
      redirect_to all_cities_path
    else 
      flash[:error] = "Coud not save the city."
      render action: "new", status: :unprocessable_entity
    end
  end

  def edit
    find_city
  end

  def update
    find_city
    if @city.update(city_params)
      redirect_to all_cities_path
    else
      flash[:error] = "Coud not update the city."
      render action: "new", status: :unprocessable_entity
    end
  end

  def destroy
    find_city
    # @city.start_rides.destroy_all  --> dependent: :destroy
    # @city.end_rides.destroy_all
    @city.destroy
    redirect_to all_cities_path
  end

  def city_params
    params.require(:city).permit(:name)
  end

  def find_city
    @city = City.find(params[:id])
  end
end
