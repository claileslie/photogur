class PicturesController < ApplicationController
  def index
    @pictures = Picture.all
  end

  def new
    @picture = Picture.new
  end

  def create
    # make a new picture with what picture_params returns - method we're calling)
    @picture = Picture.new(picture_params)
    if @picture.save
      # if the save was successful, go to index.html.erb
      redirect_to pictures_url
    else
      # otherwise render the view associated with the action :new
      render :new
    end
  end

  def edit
    @picture = Picture.find(params[:id])
  end

  def update
    @picture = Picture.find(params[:id])

    if @picture.update_attributes(picture_params)
      redirect_to "/pictures/#{@picture.id}"
    else
      render :edit
    end
  end

  private
  def picture_params
    params.require(:picture).permit(:artist, :title, :url)
  end

end
