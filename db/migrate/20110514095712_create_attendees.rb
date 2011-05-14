class CreateAttendees < ActiveRecord::Migration
  def self.up
    create_table :attendees, :id => false do |t|
      t.references :users
      t.references :events

      t.timestamps
    end
  end

  def self.down
    drop_table :attendees
  end
end
