class AddArtistIdToSong < ActiveRecord::Migration
  def self.up
    add_column :songs, :artist_id, :integer
  end

  def self.down
    drop_column :songs, :artist_id
  end
end
