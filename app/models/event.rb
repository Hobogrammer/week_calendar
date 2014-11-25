class Event < ActiveRecord::Base

  def self.get_events
    week_list = ['sunday', 'monday',' tuesday', 'wednesday', 'thursday', 'friday', 'saturday']
    events = Hash.new([])
    week_list.each do |day|
      day_events = Event.where(day: day)
      day_events.each do |event|
        events[day] = events[day] << event
      end
    end
  end
end
