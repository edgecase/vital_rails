require 'rubygems'
require 'active_record'

ActiveRecord::Base.establish_connection(
  :adapter => "sqlite3",
  :database => 'vital_rails.sqlite3'
)

ActiveRecord::Schema.define do
  
  create_table :songs, :force => true do |songs|
    songs.column :name, :string
    songs.column :duration, :integer
  end

end

