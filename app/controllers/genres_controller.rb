class GenresController < ApplicationController
    before_action :find_genre, only: [:show, :edit, :update]

    def index
        @genres = Genre.all
    end

    def new
        @genre = Genre.new
    end

    def show
        # find_genre
    end

    def create
        @genre = Genre.new(genre_params)

        if @genre.save
            redirect_to genres_path
        else
            render :new
        end
    end

    def edit
        # find_genre
    end

    def update
        # find_genre
        if @genre.update(genre_params)
            redirect_to genre_path
        else
            render :edit
        end
    end

    private
    def find_genre
        @genre = Genre.find(params[:id])
    end

    def genre_params
        params.require(:genre).permit(:name)
    end
end
