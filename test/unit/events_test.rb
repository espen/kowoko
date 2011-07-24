require 'test_helper'

class EventsTest < ActiveSupport::TestCase
  test "can save event" do
    e = Event.new( :description => 'Hacking at The Dome' )
    assert e.save
  end
end
