class EventsController < ApplicationController

  def new
    @event = Event.new
  end

  def create
    @event = Event.create(event_params)
    @event.day = @event.day.downcase

    if @event.save
      redirect_to root_path, success: "Event created successfully"
    else
      render new
    end
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
    @event = Event.create(event_params)
  end

  protected

  def event_params
    params.require(:event).permit(:name,:day, :start_time, :end_time)
  end
end
