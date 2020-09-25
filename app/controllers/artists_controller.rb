class ArtistsController < ApplicationController

    def index
        @artists = Artist.all
    end

    def show
        current_artist
    end

    def new
        @artist = Artist.new
    end

    def create
        @artist = Artist.create(artist_params)

        if @artist.save
            redirect_to @artist
        else
            flash[:alert] = @artist.errors.full_messages.join(". ")
            redirect_to new_artist_path
        end
    end

    def edit
        current_artist
    end

    def update
        current_artist
        @artist.update(artist_params)
        redirect_to @artist
    end

    def destroy

    end




    private

        def current_artist
            @artist = Artist.find_by(id: params[:id])
        end

        def artist_params
            params.require(:artist).permit(:name, :bio)
        end
end
