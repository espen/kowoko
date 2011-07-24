class Event < ActiveRecord::Base
  has_many :event_attendees, :class_name => 'Attendee'
  has_many :attendees, :through => :event_attendees, :source => :user
  belongs_to :creator, :class_name => 'User', :foreign_key => 'user_id'
  belongs_to :city
  
  validates_presence_of :starts_at, :user_id
  
  attr_accessor :city_name, :starts_at_date, :starts_at_time
  attr_accessible :starts_at, :description
  attr_accessible :starts_at_time, :starts_at_date, :city_name

  before_validation :set_starts_at, :set_city
  
  def duration=(val)
    self.ends_at = self.starts_at + "#{val}".to_i.hours
  end
  
  protected
  
  def set_city
    self.city = City.find_or_create_by_name( self.city_name )
  end
  
  def set_starts_at
    return if self.starts_at?
    self.starts_at = self.starts_at_time + ' ' + self.starts_at_date
  end
  
end
