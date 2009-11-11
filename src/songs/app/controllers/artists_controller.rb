class ArtistsController < ApplicationController

  def index
    @artists = Artist.find :all
  end
  
  def show
    @artist = Artist.find(params[:id])
  end
  
  def new
    @artist = Artist.new
  end
  
  def edit
    @artist = Artist.find(params[:id])
  end
  
  def update
    @artist = Artist.find(params[:id])
    result = @artist.update_attributes(params[:artist])
    
    if result
      flash[:success] = "Edited #{@artist.name} successfully"
      redirect_to artists_url
    else
      render :edit
    end
  end

  def create
    @artist = Artist.create(params[:artist])
    
    if @artist.save
      flash[:success] = "Added a new artist successfully"
      redirect_to artists_url
    else
      render :new
    end
  end
  
  def destroy
    artist = Artist.find(params[:id])
    artist.destroy
    
    flash[:success] = "Artist: #{artist.name} was deleted"
    redirect_to artists_url
  end
  
end
