class ProfilesController < ApplicationController

  def new
    @schedule = Schedule.find(params[:schedule_id])
    @profile = Profile.new
  end

  def create
    @profile = Profile.new(profile_params)
    if @profile.save
      redirect_to schedule_path(@profile.schedule)
    else
      render :new
    end
  end

  def show
    @profile = Profile.find(params[:id])
  end

  def edit
    @schedule = Schedule.find(params[:schedule_id])
    @profile = Profile.find(params[:id])
  end

  def update
  end

  private
  def profile_params
    params.require(:profile).permit(:customer_first_name, :customer_last_name, :customer_occupation, :position, :note).merge(schedule_id: params[:schedule_id])
  end

end
