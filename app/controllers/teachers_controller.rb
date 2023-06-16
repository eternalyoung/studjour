class TeachersController < ApplicationController
  before_action :set_teacher, only: %i[edit update destroy]

  # GET /teachers/new
  def new
    @teacher = Teacher.new
  end

  # GET /teachers/1/edit
  def edit
  end

  # POST /teachers
  def create
    @teacher = Teacher.new(teacher_params)

    if @teacher.save
      redirect_to @teacher, notice: "Преподаватель успешно создан."
    else
      render :new, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /teachers/1
  def update
    if @teacher.update(teacher_params)
      redirect_to @teacher, notice: "Преподаватель успешно обновлён."
    else
      render :edit, status: :unprocessable_entity
    end
  end

  # DELETE /teachers/1
  def destroy
    @teacher.destroy
    redirect_to groups_url, notice: "Преподаватель успешно удалён."
  end

  private

  def authorization
    render_forbidden unless current_user&.able_to_edit?(:schedule)
  end

  # Use callbacks to share common setup or constraints between actions.
  def set_teacher
    @teacher = Teacher.find(params[:id])
  end

  # Only allow a list of trusted parameters through.
  def teacher_params
    params.require(:teacher).permit(:name)
  end
end
