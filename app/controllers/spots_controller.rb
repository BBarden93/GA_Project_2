class SpotsController < ApplicationController
  def index
    @spots = Spot.all
  end

  def show
    @spot = Spot.find(1)
    @user = User.find(@spot.user_id)
  end

  def new
    @spot = current_user.spots.new
  end

  def create
    @spot = current_user.spots.new spot_params
    @spot.save
    redirect_to spot_path(@spot.id)
  end

  def edit
  end

  def update
  end

  def destroy
  end

  def authorize_post_view
    @spot = Spot.find(params[:id])
    if @spot.user_id != current_user.id
      redirect_to root_path
    end
  end
  
  private
  def spot_params
    return params.require(:spot).permit(:location, :description, :obstacles)
  end
end
