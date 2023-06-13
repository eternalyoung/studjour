class EventsController < ApplicationController
  before_action :set_event, only: :destroy

  def create
    @event = Event.new(event_params)

    if @event.save
      redirect_to events_path, notice: "Event was successfully created."
    else
      render :new, status: :unprocessable_entity
    end
  end

  def destroy
    @event.destroy
    redirect_to events_url, notice: "Event was successfully destroyed."
  end

  private

  def set_event
    @event = Event.find(params[:id])
  end

  def event_params
    params.require(:event).permit(:title, :description, :datetime)
  end
end