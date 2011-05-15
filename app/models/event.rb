class Event < ActiveRecord::Base
  has_many :attendees
  has_many :users, :through => :attendees
  belongs_to :creator, :class_name => "User", :foreign_key => "user_id"
  
  validates_presence_of :starts_at, :user_id
  
  attr_accessor :duration, :city
  attr_accessible :starts_at, :ends_at, :description, :duration
  
  def duration=(val)
    self.ends_at = self.starts_at + "#{val}".to_i.hours
  end
  
end
