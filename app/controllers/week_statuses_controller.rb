class WeekStatusesController < ApplicationController
  before_action :set_week_status

  def toggle
    @week_status.update(even_week: !@week_status.even_week)
    respond_to do |format|
      format.html { redirect_to root_path }
      format.js
    end
  end

  private

  def set_week_status
    @week_status = WeekStatus.first_or_create
  end
end
