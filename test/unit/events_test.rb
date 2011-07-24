require 'test_helper'

class EventsTest < ActiveSupport::TestCase
  self.use_instantiated_fixtures  = true
  
  test 'can save event' do
    e = Event.new( :description => 'Hacking at The Dome', :starts_at => Time.zone.now.next_week + 13.hours, :city_name => 'Kuala Lumpur' )
    e.creator = @espen
    assert e.save
  end

  test 'can save event with start time and date in two fields' do
    e = Event.new( :description => 'Hacking at The Dome', :starts_at_date => Time.zone.now.next_week.strftime('%d.%m.%Y'), :starts_at_time => Time.zone.now.strftime('%H:%M'), :city_name => 'Kuala Lumpur' )
    e.creator = @espen
    e.save
    assert e.save
  end

  test 'should not save without starting time' do
    e = Event.new( :description => 'Hacking at The Dome', :city_name => 'Kuala Lumpur' )
    e.creator = @espen
    assert !e.save
    assert e.errors['starts_at'].any?
  end

  test 'should not save without creator' do
    e = Event.new( :description => 'Hacking at The Dome', :starts_at => Time.zone.now.next_week.beginning_of_day + 13.hours, :city_name => 'Kuala Lumpur' )
    assert !e.save
    assert e.errors['user_id'].any?
  end


end
