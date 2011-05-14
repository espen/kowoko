class Events < ActiveRecord::Base
  has_many :attendees
end
