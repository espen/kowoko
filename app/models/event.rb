class Event < ActiveRecord::Base
  has_many :event_attendees, :class_name => 'Attendee'
  has_many :attendees, :through => :event_attendees, :source => :user
  belongs_to :creator, :class_name => 'User', :foreign_key => 'user_id'
  belongs_to :city
  
  validates_presence_of :starts_at, :user_id, :city_id, :place
  
  attr_accessor :city_name, :starts_at_date, :starts_at_time
  attr_accessible :starts_at, :description, :place
  attr_accessible :starts_at_time, :starts_at_date, :city_name

  before_validation :set_starts_at, :set_city
  after_create :set_creator_to_attend
  
  
  def to_param
    "#{self.id}-#{self.place.parameterize}-#{self.starts_at.to_date.to_s(:db)}"
  end
  
  
  def duration=(val)
    self.ends_at = self.starts_at + '#{val}'.to_i.hours
  end
  
  protected
  
  def set_city
    self.city = City.find_or_create_by_name( self.city_name ) if !self.city && self.city_name
  end
  
  def set_starts_at
    return if self.starts_at || (!self.starts_at_time || !self.starts_at_date)
    self.starts_at = self.starts_at_time + ' ' + self.starts_at_date
  end
  
  def set_creator_to_attend
    self.attendees << self.creator
  end
  
end
