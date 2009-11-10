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