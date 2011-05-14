class AddCityToEvent < ActiveRecord::Migration
  def self.up
    add_column :events, :city_id, :integer
  end

  def self.down
    remove_column :events, :city_id
  end
end
