class AddSlugToCity < ActiveRecord::Migration
  def self.up
    add_column :cities, :slug, :string
    
    City.all.each {|c| c.save }
  end

  def self.down
    remove_column :cities, :slug
  end
end
