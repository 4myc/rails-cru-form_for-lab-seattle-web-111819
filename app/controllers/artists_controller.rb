class ArtistsController < ApplicationController
    before_action :find_artist, only: [:show, :edit, :update]

    def index
       @artists = Artist.all 
    end

    def new
        @artist = Artist.new
    end

    def show
        # find_artist
    end

    def create
        @artist = Artist.new(artist_params)

        if @artist.save
            redirect_to artists_path
        else
            render :new
        end
    end

    def edit
        # find_artist
    end

    def update
        # find_artist

        if @artist.update(artist_params)
            redirect_to artist_path
        else
            render :edit
        end
    end

    private
    def find_artist
        @artist = Artist.find(params[:id])
    end

    def artist_params
        params.require(:artist).permit(:name, :bio)
    end
end
