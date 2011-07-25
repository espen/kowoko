class City < ActiveRecord::Base
  has_many :events
  
  validates_uniqueness_of :name
  validates_presence_of :name
  
  before_save :create_slug
  
  
  def to_param
    name.parameterize
  end
  
  protected
  
  def create_slug
    self.slug = self.name.parameterize
  end
  
end