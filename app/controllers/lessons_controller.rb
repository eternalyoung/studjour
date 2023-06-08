class LessonsController < ApplicationController
  before_action :set_group
  before_action :set_schedule
  before_action :set_lesson, only: %i[show edit update destroy]

  # GET /lessons
  def index
    @lessons = Lesson.all
  end

  # GET /lessons/1
  def show
  end

  # GET /lessons/new
  def new
    @lesson = @schedule.lessons.new
  end

  # GET /lessons/1/edit
  def edit
  end

  # POST /lessons
  def create
    @lesson = @schedule.lessons.new(lesson_params)

    if @lesson.save
      redirect_to group_path(@group), notice: "Урок успешно создан."
    else
      render :new, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /lessons/1
  def update
    if @lesson.update(lesson_params)
      redirect_to group_path(@group), notice: "Урок успешно обновлен."
    else
      render :edit, status: :unprocessable_entity
    end
  end

  # DELETE /lessons/1
  def destroy
    @lesson.destroy
    redirect_to group_path(@group), notice: "Урок успешно удалён."
  end

  private

  def set_group
    @group = Group.find(params[:group_id])
  end

  def set_schedule
    @schedule = Schedule.find(params[:schedule_id])
  end

  # Use callbacks to share common setup or constraints between actions.
  def set_lesson
    @lesson = Lesson.find(params[:id])
  end

  # Only allow a list of trusted parameters through.
  def lesson_params
    params.require(:lesson).permit(:number, :adjacent, :schedule_id, :subject_id, :teacher_id, :room, :got_changes)
  end
end
