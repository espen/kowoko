require 'test_helper'

class EventsTest < ActiveSupport::TestCase
  self.use_instantiated_fixtures  = true
  
  test "can save event" do
    e = Event.new( :description => 'Hacking at The Dome', :starts_at => Time.zone.now.next_week.beginning_of_day + 13.hours, :duration => 2 )
    e.creator = @espen
    assert e.save
  end
end
