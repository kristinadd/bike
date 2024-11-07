class ApplicationController < ActionController::Base
  helper_method :current_user, :reactions_count, :love_reactions, :celebrate_reactions
  
  def current_user
    @current_user ||= User.find_by(id: session[:user_id])
  end

  def authenticate_user!
    unless current_user
      redirect_to new_session_path
    end
  end

  def reactions_count(ride)
    ride.reactions.count
  end

  def love_reactions(ride)
    @reactions = Reaction.where(reaction_type: 'love', ride_id: ride.id).count
  end

  def celebrate_reactions(ride)
    @reactions = Reaction.where(reaction_type: 'celebrate', ride_id: ride.id).count
  end
end
