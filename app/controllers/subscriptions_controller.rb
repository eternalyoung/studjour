class SubscriptionsController < ApplicationController
  before_action :set_event

  def create
    @subscription = @event.subscriptions.build(user: current_user, event_id: params[:event_id])

    if @subscription.save
      flash[:success] = "Вы успешно подписались на мероприятие."
    else
      flash[:error] = "Не удалось создать подписку."
    end

    redirect_to events_path
  end

  def destroy
    @subscription = current_user.subscriptions.find_by(event_id: params[:event_id])
    if @subscription
      @subscription.destroy
      flash[:success] = "Вы успешно отписались от мероприятия."
    else
      flash[:error] = "Подписка не найдена."
    end

    redirect_to events_path
  end

  private

  def authorization
    render_forbidden unless current_user
  end

  def set_event
    @event = Event.find(params[:event_id])
  end
end
