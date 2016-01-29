class BandsController < ApplicationController

  before_action :logged_in?

  def index
    @bands = Band.all
    render :index
  end

  def new
    @band = Band.new
    render :new
  end

  def edit
    @band = Band.find(params[:id])
    render :edit
  end

  def update
    @band = Band.find(params[:id])
    if @band.update(band_params)
      redirect_to band_url(@band)
    else
      flash.now[:errors] = @band.errors.full_messages
      render :new
    end
  end

  def create
    @band = Band.new(band_params)
    if @band.save
      redirect_to band_url(@band)
    else
      render :new
    end
  end

  def show
    @band = Band.find(params[:id])
    p @band
    render :show
  end

  def destroy
    @band = Band.find(params[:id])
    @band.destroy if @band
    redirect_to bands_url
  end







  private

  def band_params
    params.require(:band).permit(:band_name)
  end



end
