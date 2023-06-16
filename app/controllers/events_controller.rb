class EventsController < ApplicationController
  before_action :set_event, only: %i[edit destroy update]

  def index
    @events = Event.all
  end

  def new
    @event = Event.new
  end

  def edit
  end

  def create
    @event = Event.new(event_params)

    if @event.save
      redirect_to events_path, notice: "Мероприятие успешно создано."
    else
      render :new, status: :unprocessable_entity
    end
  end

  def update
    if @event.update(event_params)
      redirect_to events_path, notice: "Мероприятие успешно обновлено."
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    @event.destroy
    redirect_to events_url, notice: "Мероприятие успешно удалено."
  end

  private

  def authorization
    render_forbidden unless current_user&.able_to_edit?(:event)
  end

  def set_event
    @event = Event.find(params[:id])
  end

  def event_params
    params.require(:event).permit(:title, :description, :datetime)
  end
end
