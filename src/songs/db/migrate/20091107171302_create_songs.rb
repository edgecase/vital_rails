class CreateSongs < ActiveRecord::Migration
  def self.up
    create_table :songs do |t|
      t.string :name, :null => false
      t.integer :duration, :null => false
      t.timestamps
    end
    
    Song.create! :name => "Allentown", :duration => 263
    Song.create! :name => "Uptown Girl", :duration => 189
    Song.create! :name => "An Innocent Man", :duration => 369
    Song.create! :name => "Angry Young Man", :duration => 323
    Song.create! :name => "A Matter of Trust", :duration => 309
    Song.create! :name => "Only the Good Die Young", :duration => 201
    Song.create! :name => "Baby Grand", :duration => 369
    Song.create! :name => "Big Shot", :duration => 289
    Song.create! :name => "Honesty", :duration => 239
    Song.create! :name => "Goodnight Saigon", :duration => 440
  
  end

  def self.down
    drop_table :songs
  end
end
