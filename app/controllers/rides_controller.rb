class RidesController < ApplicationController 
    # callbacks; are comming from Rails
    # find_ride is called in every method where needed, insted of:
    # before_action :find_ride, only: [:edit, :update, :destroy]
    before_action :authenticate_user!

    def index
        @rides = Ride.includes(:user, :start_city, :end_city, :reactions).all.order("created_at DESC")
    end

    def new
        @ride = Ride.new
    end

    def create
        @ride = Ride.new(ride_params)
        @ride.recommendation = @ride.generate_restaurant_recommendations
        @ride.distance = @ride.calculate_distance
        @ride.user_id = current_user.id if current_user.present?
        if @ride.save
            redirect_to all_rides_path
        else 
            flash[:error] = "Coud not save the Ride"
            render action: "new", status: :unprocessable_entity
        end
    end

    def edit
        find_ride
        authorize_user!
    end

    def update
        find_ride
        authorize_user!
        if @ride.update(ride_params)
            redirect_to all_rides_path
         else
            flash[:error] = "Coud not update the ride"
            render action: "new", status: :unprocessable_entity
        end
    end

    def destroy
        find_ride
        authorize_user!
        @ride.destroy
        redirect_to root_path
    end

    def find_ride
        @ride = Ride.find(params[:id])
    end

    def authorize_user!
      unless @ride.user == current_user
        flash[:alert] = "You are not authorized to edit or delete this ride."
      end
    end

    def ride_params
        params.require(:ride).permit(:name, :start_city_id, :end_city_id)
    end
end
