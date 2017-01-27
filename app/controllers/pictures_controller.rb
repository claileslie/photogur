class PicturesController < ApplicationController
  def index
    @pictures = Picture.all
  end

  def new

  end

  def create
    render text: "Saving a picture. URL: #{params[:url]}, Title: #{params[:title]}, Artist #{params[:artist]}"
  end
end
