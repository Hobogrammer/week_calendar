class Event < ActiveRecord::Base

  def self.get_events
    week_list = ['sunday', 'monday',' tuesday', 'wednesday', 'thursday', 'friday', 'saturday']
    events = Hash.new()
    week_list.each do |day|
      day_events = Event.where(day: day)
      events[day] = day_events
    end
    events
  end

  def self.time_hash
    time_range = (0..24)
    time_hash = {}
    time_range.step(0.5) { |x| time_hash[x] = 0 }
    time_hash
  end

  def self.available?(day_hash, time)
    day_hash[time].zero? ? true : false
  end

  def self.collision_check(usr_event)
    range = (usr_event.start_time.hour..usr_event.end_time.hour)
    time_hash = Event.time_hash
    available_flag = true
    events = hash_by_day(usr_event.day)
    range.step(0.5) do |time|
      if !Event.available?(events, time) 
        available_flag = false
        break
      end
    end
    available_flag
  end

  def Event.hash_by_day(day)
    events = Event.where(day: day)
    event_hash = {}
    events.each do |event|
      event_range = (event.start_time.hour..event.end_time.hour)
      event_range.step(0.5) { |x| event_hash[x] = 1}
    end
    event_hash
  end
end
