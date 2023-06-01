class UsersController < ApplicationController
  before_action :set_user

  # GET /users/1
  def show
  end

  # GET /users/1/edit
  def edit
  end

  # PATCH/PUT /users/1
  def update
    if @user.update(user_params)
      redirect_to profile_edit_path, notice: "User was successfully updated."
    else
      render :edit, status: :unprocessable_entity
    end
  end

  private

  def set_user
    @user = current_user
  end

  def user_params
    params.require(:user).permit(:tag, :group_id, :sub_to_schedule, :sub_to_changes, :sub_to_all_events)
  end
end
