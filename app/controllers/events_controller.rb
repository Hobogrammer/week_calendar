class EventsController < ApplicationController

  def new
    @event = Event.new
  end

  def create
    @event = Event.create(event_params)
    @event.day = @event.day.downcase

    if Event.collision_check(@event) && @event.save
      redirect_to root_path, success: "Event created successfully"
    else
      binding.pry
      redirect_to root_path, failure: "Event could not save"
    end
  end

  def show
    @event = Event.find(params[:id])
  end

  def calendar
    @events = Event.get_events
    @time_hash = Event.time_hash
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

  def destroy
    event = Event.find(params[:id])

    if event.destroy
      redirect_to root_path, success: "Event destroyed"
    else
      render index
    end
  end

  protected

  def event_params
    params.require(:event).permit(:name,:day, :start_time, :end_time)
  end
end
