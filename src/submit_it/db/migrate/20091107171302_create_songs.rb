class CreateSongs < ActiveRecord::Migration
  def self.up
    create_table :songs do |t|
      t.string :name, :null => false
      t.integer :duration, :null => false
      t.timestamps
    end
  end

  def self.down
    drop_table :songs
  end
end
