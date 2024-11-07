class HomeController < ApplicationController
  before_action :authenticate_user!
  def index
    redirect_to(new_session_path) unless current_user

    @activity_count = current_user.rides.count if current_user.present?
  end
end
