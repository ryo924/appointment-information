class SchedulesController < ApplicationController
  def index
    @schedules = Schedule.all.order(created_at: "DESC")
  end

  def new
    @schedule = Schedule.new
  end

  def create
    @schedule = Schedule.new(schedule_params)
    if @schedule.save
      redirect_to root_path
    else
      render :new
    end
  end

  def show
    @schedule = Schedule.find(params[:id])
  end

  def edit
    @schedule = Schedule.find(params[:id])
  end

  def update
    if @schedule.update(schedule_params)
      redirect_to schedule_path(@schedule)
    else
      render :edit
    end
  end

  def destroy
    @schedule = Schedule.find(params[:id])
    if @schedule.destroy
      redirect_to root_path
    else
      redirect_to root_path
    end
  end

  private
  def schedule_params
    params.require(:schedule).permit(:title, :company, :person, :date, :place, :purpose, :relation_id).merge(user_id: current_user.id)
  end

end
