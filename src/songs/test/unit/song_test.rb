require 'test_helper'

class Song
  def self.valid_options
    {
      :name => "Unity",
      :duration => 210
    }
  end
end

class SongTest < ActiveSupport::TestCase
  # Replace this with your real tests.
  test "the truth" do
    assert true
  end

  test "Saving Name" do
    song = Song.create(:name => "Unity", :duration => 210)

    assert_equal "Unity", song.name
    assert_equal 210, song.duration
  end

  test "Name can't be blank" do
    song = Song.new(:name => nil, :duration => 210)

    assert ! song.valid?
    assert song.errors.on(:name)
    assert_match(/needs to be included/, song.errors.on(:name).to_s)
  end

  test "Name can't be blank 2" do
    song = Song.new(:name => nil, :duration => 210)
    assert_errors_on(song, :name, /needs to be included/)
  end

  test "Duration can't be blank" do
    song = Song.new(:name => "Unity", :duration => nil)

    assert ! song.valid?
    assert song.errors.on(:duration)
    assert_match(/(n't|not).*blank/, song.errors.on(:duration).to_s)
  end

  test "Duration must be a number" do
    song = Song.new(:name => "Unity", :duration => "X")

    assert ! song.valid?
    assert song.errors.on(:duration)
    assert_match(/(n't|not).*number/, song.errors.on(:duration).to_s)
  end

  VALID_OPTIONS = {
    :name => "Unity",
    :duration => 210
  }

  test "Can Create Valid Song" do
    song = Song.new(VALID_OPTIONS)
    assert song.valid?
  end

  test "Name can't be blank 3" do
    song = Song.new(VALID_OPTIONS.merge(:name => nil))
    assert_errors_on(song, :name, /needs to be included/)
  end
  
  test "Name can't be blank 4" do
    assert_validates_presence_of(Song, :name, /needs to be included/)
  end
  
  private

  def assert_errors_on(obj, field, pattern)
    assert ! obj.valid?
    assert obj.errors.on(field)
    assert_match(pattern, obj.errors.on(field).to_s) if pattern
  end

  def assert_validates_presence_of(klass, field, pattern=/(n't|not).*blank/)
    instance = klass.new(klass.valid_options.merge(field => nil))
    assert_errors_on(instance, field, pattern)
  end

  test "Duration Converts to Minutes and Seconds" do
    song = Song.new(Song.valid_options)
    assert_equal [3, 30], song.duration_minutes_seconds
  end
end
