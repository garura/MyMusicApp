class AlbumsController < ApplicationController

  before_action :logged_in?

  def new
    @album = Album.new
    @album.band_id = params[:band_id]
    render :new
  end

  def create
    @album = Album.new(album_params)
    # @album.convert_live_record
    if @album.save
      redirect_to album_url(@album)  # MISSING :SHOW
    else
      flash.now[:errors] = @album.errors.full_messages
      render :new
    end
  end

  def show
    @album = Album.find(params[:id])
    render :show
  end

  def destroy
    @album = Album.find(params[:id])
    @album.destroy if @album
    redirect_to band_url(@album.band_id)
  end








  private

  def album_params
    params.require(:album).permit(:band_id, :album_name, :live_record)
  end
end
