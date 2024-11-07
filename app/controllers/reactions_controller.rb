class ReactionsController < ApplicationController
  before_action :authenticate_user!

  def create
    @user = User.find_by(id: current_user.id)
    @ride = Ride.find_by(id: params[:ride_id])
    @reaction = Reaction.new
    @reaction.user_id = @user.id
    @reaction.ride_id = @ride.id
    @reaction.reaction_type = params[:reaction_type]
    
    @reaction.save

    redirect_to all_rides_path(anchor: "ride-#{@ride.id}")
  end
end
