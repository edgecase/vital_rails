class SongsController < ApplicationController

  def index
    @songs = Song.find :all
  end
  
  def show
    @song = Song.find(params[:id])
  end
  
  def new
    @song = Song.new
  end
  
  def edit
    @song = Song.find(params[:id])
  end
  
  def update
    @song = Song.find(params[:id])
    result = @song.update_attributes(params[:song])
    
    if result
      flash[:success] = "Edited #{@song.name} successfully"
      redirect_to songs_url
    else
      render :edit
    end
  end

  def create
    @song = Song.create(params[:song])
    
    if @song.save
      flash[:success] = "Added a new song successfully"
      redirect_to songs_url
    else
      render :new
    end
  end
  
  def destroy
    song = Song.find(params[:id])
    song.destroy
    
    flash[:success] = "Song: #{song.name} was deleted"
    redirect_to songs_url
  end
  
end
