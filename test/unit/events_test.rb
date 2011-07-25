require 'test_helper'

class EventsTest < ActiveSupport::TestCase
  self.use_instantiated_fixtures  = true
  
  test 'can save event' do
    e = Event.new( :description => 'Hacking at The Dome', :starts_at => Time.zone.now.next_week + 13.hours, :city_name => 'Kuala Lumpur', :place => 'The Dome, Pavillion' )
    e.creator = @espen
    assert e.save
  end

  test 'can save event with start time and date in two fields' do
    e = Event.new( :description => 'Hacking at Starbucks', :starts_at_date => Time.zone.now.next_week.strftime('%d.%m.%Y'), :starts_at_time => Time.zone.now.strftime('%H:%M'), :city_name => 'Kuala Lumpur', :place => 'Starbucks, Pavillion' )
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
    e = Event.new( :description => 'Hacking at The Dome', :starts_at => Time.zone.now.next_week.beginning_of_day + 13.hours, :city_name => 'Kuala Lumpur', :place => 'A place' )
    assert !e.save
    assert e.errors['user_id'].any?
  end

  test 'should not save without city' do
    e = Event.new( :description => 'Hacking at The Dome', :starts_at => Time.zone.now.next_week.beginning_of_day + 13.hours)
    e.creator = @espen
    assert !e.save
    assert e.errors['city_id'].any?
  end

  test 'should not save without place' do
    e = Event.new( :description => 'Hacking at The Dome', :starts_at => Time.zone.now.next_week.beginning_of_day + 13.hours, :city_name => 'Kuala Lumpur' )
    e.creator = @espen
    assert !e.save
    assert e.errors['place'].any?
  end


end
