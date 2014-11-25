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
    time_hash = Hash.new
    time_range.step(0.5) { |x| time_hash[x]  = 0 }
    time_hash
  end
end
