class LessonsChangesController < ApplicationController
  before_action :set_lessons_change, only: %i[show edit update destroy]

  # GET /lessons_changes
  def index
    date_param = params[:date]

    date = if date_param.present?
      Date.parse(date_param)
    elsif Time.zone.now.hour >= 12
      Date.tomorrow
    else
      Date.today
    end

    @lessons_changes = LessonsChange.where(date:).order(:group_id, number: :asc)
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
      redirect_to lessons_changes_path, notice: "Изменение успешно создано."
    else
      render :new, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /lessons_changes/1
  def update
    if @lessons_change.update(lessons_change_params)
      redirect_to lessons_changes_path, notice: "Изменение успешно изменено."
    else
      render :edit, status: :unprocessable_entity
    end
  end

  # DELETE /lessons_changes/1
  def destroy
    @lessons_change.destroy
    redirect_to lessons_changes_url, notice: "Изменение успешно удалено."
  end

  private

  def authorization
    render_forbidden unless current_user&.able_to_edit?(:change)
  end

  # Use callbacks to share common setup or constraints between actions.
  def set_lessons_change
    @lessons_change = LessonsChange.find(params[:id])
  end

  # Only allow a list of trusted parameters through.
  def lessons_change_params
    params.require(:lessons_change).permit(:group_id, :number, :subject_id, :teacher_id, :room, :date)
  end
end
