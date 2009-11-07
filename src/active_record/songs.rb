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
  
  LONG_SONG = 300
  
  validates_presence_of :name, :message => "needs to be included"
  validates_presence_of :duration
  validates_numericality_of :duration
  validate :no_kids_songs

  def self.find_long_songs
    find :all, 
      :conditions => ['duration > ?', LONG_SONG], 
      :order => :duration
  end

  def no_kids_songs
    if ["Twinkle, Twinkle", "Row, Row, Row"].include?(name)
      errors.add_to_base("No kids songs allowed") 
    end
  end

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

