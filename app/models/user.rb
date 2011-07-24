class User < ActiveRecord::Base
  has_many :event_attendenents, :class_name => 'Attendee'
  has_many :attended_events, :through => :event_attendenents, :source => :event
  has_many :created_events, :class_name => 'Event'
  
  def self.create_with_omniauth(auth)
    create! do |user|
      user.provider = auth["provider"]
      user.uid = auth["uid"]
      user.name = auth["user_info"]["name"]
      user.nickname = auth["user_info"]["nickname"]
    end
  end
end
