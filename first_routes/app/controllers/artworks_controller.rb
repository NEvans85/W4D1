class ArtworksController < ApplicationController
  def index
    user = User.find(params[:id])
    @artworks = user.artworks + user.shared_artworks
    if @artworks
      render json: @artworks
    else
      render json: @artworks.errors.full_messages, status: 404
    end
  end

  def create
    @artwork = Artwork.new(artwork_params)
    if @artwork.save
      render json: @artwork
    else
      render json: @artwork.errors.full_messages, status: 422
    end
  end

  def delete
    @artwork = Artwork.find(params[:id])
    if @artwork.destroy
      render json: @artwork
    else
      render json: @artwork.errors.full_messages, status: 404
    end
  end

  def show
    @artwork = Artwork.find(params[:id])
    if @artwork
      render json: @artwork
    else
      render json: @artwork.errors.full_messages, status: 404
    end
  end

  def update
    @artwork = Artwork.find(params[:id])
    if @artwork.update(artwork_params)
      render json: @artwork
    else
      render json: @artwork.errors.full_messages, status: 404
    end
  end

  private

  def artwork_params
    params.require(:artwork).permit(:artist_id, :title, :img_url)
  end
end
