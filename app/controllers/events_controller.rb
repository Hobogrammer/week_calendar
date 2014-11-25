class EventsController < ApplicationController

  def new
    @event = Event.new
  end

  def create
    @event = Event.build(event_params)
  end

  def show
    @event = Event.find(params[:id])
  end

  def calendar
    @events = Event.get_events
  end

  def index
    @events = Event.all
  end

  def edit
    @event = Event.find(parmas[:id])
  end

  def update
    @event = Event.build(event_params)
  end

  protected

  def event_params
    params.require(:event).permit(:name,:day, :start_time, :end_time)
  end
end
