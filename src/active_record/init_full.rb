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

class Song < ActiveRecord::Base
  
  validates_presence_of :name, :message => "needs to be included"
  validates_presence_of :duration
  validates_numericality_of :duration
  validate :no_kids_songs

  def no_kids_songs
    if ["Twinkle, Twinkle", "Row, Row, Row"].include?(name)
      errors.add_to_base("No kids songs allowed") 
    end
  end

end


