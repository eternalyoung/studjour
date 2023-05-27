class LessonsChangesController < ApplicationController
  before_action :set_lessons_change, only: %i[show edit update destroy]

  # GET /lessons_changes
  def index
    @lessons_changes = LessonsChange.all
  end

  # GET /lessons_changes/1
  def show
  end

  # GET /lessons_changes/new
  def new
    @lessons_change = LessonsChange.new
  end

  # GET /lessons_changes/1/edit
  def edit
  end

  # POST /lessons_changes
  def create
    @lessons_change = LessonsChange.new(lessons_change_params)

    if @lessons_change.save
      redirect_to @lessons_change, notice: "Lessons change was successfully created."
    else
      render :new, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /lessons_changes/1
  def update
    if @lessons_change.update(lessons_change_params)
      redirect_to @lessons_change, notice: "Lessons change was successfully updated."
    else
      render :edit, status: :unprocessable_entity
    end
  end

  # DELETE /lessons_changes/1
  def destroy
    @lessons_change.destroy
    redirect_to lessons_changes_url, notice: "Lessons change was successfully destroyed."
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_lessons_change
    @lessons_change = LessonsChange.find(params[:id])
  end

  # Only allow a list of trusted parameters through.
  def lessons_change_params
    params.require(:lessons_change).permit(:lesson_id, :subject_id, :teacher_id, :room_id)
  end
end
