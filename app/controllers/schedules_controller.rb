class SchedulesController < ApplicationController
  before_action :set_group
  before_action :set_schedule, only: %i[show edit update destroy]

  # GET /schedules
  def index
    @schedules = Schedule.preload(:lessons).all
  end

  # GET /schedules/1
  def show
  end

  # GET /schedules/new
  def new
    @schedule = @group.schedule.new
  end

  # GET /schedules/1/edit
  def edit
  end

  # POST /schedules
  def create
    @schedule = @group.schedule.new(schedule_params)

    if @schedule.save
      redirect_to @schedule, notice: "Schedule was successfully created."
    else
      render :new, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /schedules/1
  def update
    if @schedule.update(schedule_params)
      redirect_to @schedule, notice: "Schedule was successfully updated."
    else
      render :edit, status: :unprocessable_entity
    end
  end

  # DELETE /schedules/1
  def destroy
    @schedule.destroy
    redirect_to schedules_url, notice: "Schedule was successfully destroyed."
  end

  private

  def set_group
    @group = Group.find(params[:group_id])
  end

  # Use callbacks to share common setup or constraints between actions.
  def set_schedule
    @schedule = Schedule.find(params[:id])
  end

  # Only allow a list of trusted parameters through.
  def schedule_params
    params.require(:schedule).permit(:group, :weeks_day)
  end
end
