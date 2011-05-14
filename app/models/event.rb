class Event < ActiveRecord::Base
  has_many :attendees
  belongs_to :creator, :class_name => :user
  
  validates_presence_of :starts_at, :ends_at, :creator
  
  attr_accessor :duration
  attr_accessible :starts_at, :ends_at, :description, :duration
  
end
