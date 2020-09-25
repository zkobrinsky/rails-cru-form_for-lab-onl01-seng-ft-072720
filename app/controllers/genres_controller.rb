class GenresController < ApplicationController

    def index
        @genres = Genre.all
    end

    def show
        current_genre
    end

    def new
        @genre = Genre.new
    end

    def create
        @genre = Genre.create(genre_params)

        if @genre.save
            redirect_to @genre
        else
            flash[:alert] = @genre.errors.full_messages.join(". ")
            redirect_to new_genre_path
        end
    end

    def edit
        current_genre
    end

    def update
        current_genre
        @genre.update(genre_params)
        redirect_to @genre
    end

    def destroy

    end




    private

        def current_genre
            @genre = Genre.find_by(id: params[:id])
        end

        def genre_params
            params.require(:genre).permit(:name)
        end
end
