require 'rubygems'
require 'active_record'

ActiveRecord::Base.establish_connection(
  :adapter => "mysql",
  :database => 'vital_rails'
)

ActiveRecord::Schema.define do
  
  create_table :songs, :force => true do |songs|
    songs.column :name, :string
    songs.column :duration, :integer
    songs.column :artist_id, :integer
  end

  create_table :artists, :force => true do |songs|
    songs.column :name, :string
  end

end

