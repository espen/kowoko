require 'test_helper'

class CitiesTest < ActiveSupport::TestCase
  self.use_instantiated_fixtures  = true
  
  test 'saving event adds new city and find city when saving a new event with same city name' do
    e = Event.new( :description => 'Hacking with $4 brekkie', :starts_at => Time.zone.now.next_week + 13.hours, :city_name => 'Brisbane', :place => 'Fat Ricks' )
    e.creator = @espen
    assert_difference('City.count') do
      assert e.save
    end

    e = Event.new( :description => 'Hacking with $4 brekkie', :starts_at => Time.zone.now.next_week + 13.hours, :city_name => 'Brisbane', :place => 'Fat Ricks' )
    e.creator = @espen
    assert_no_difference('City.count') do
      assert e.save
    end

  end


end