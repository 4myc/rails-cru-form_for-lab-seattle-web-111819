class SongsController < ApplicationController
    before_action :find_song, only: [:show, :edit, :update]

    def index
        @songs = Song.all
    end

    def new
        @song = Song.new
    end

    def show
        # find_song
    end

    def create
        @song = Song.new(song_params)

        if @song.save
            redirect_to songs_path
        else
            render :new
        end
    end

    def edit
        # find_song
    end

    def update
        # find_song
        if @song.update(song_params)
            redirect_to song_path
        else
            render :edit
        end
    end

    private
    def find_song
        @song = Song.find(params[:id])
    end

    def song_params
        params.require(:song).permit(:name)
    end
end