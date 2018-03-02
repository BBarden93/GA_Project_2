class SpotsController < ApplicationController
  def index
    @spots = Spot.all
  end

  def show
    @spot = Spot.find(params[:id])
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
    @spot = Spot.find(params[:id])
  end

  def update
    @spot = Spot.find(params[:id])
    @spot.location = params[:spot][:location]
    @spot.descrition = params[:spot][:description]
    @spot.image = params[:spot][:image]
    @spot.obstacles = params[:spot][:obstacles] 
    @spot.save   
    redirect_to("/spots/#{@spot.id}")
  end

  def destroy
    @spot = Spot.find(params[:id])
    @spot.destroy
    redirect_to("/users")
  end

  def authorize_post_view
    @spot = Spot.find(params[:id])
    if @spot.user_id != current_user.id
      redirect_to root_path
    end
  end
  
  private
  def spot_params
    return params.require(:spot).permit(:location, :description, :obstacles, :image, :level_of_difficulty)
  end
end
