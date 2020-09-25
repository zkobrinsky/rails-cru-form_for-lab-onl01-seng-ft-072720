class SongsController < ApplicationController

    def index
        @songs = Song.all
    end

    def show
        current_song
        @genre = @song.genre
        @artist = @song.artist
    end

    def new
        @song = Song.new
    end

    def create
        @song = Song.new(song_params)
        @song.genre = Genre.find_by(id: params[:song][:genre_id])
        @song.artist = Artist.find_by(id: params[:song][:artist_id])

        @genre = @song.genre
        @artist = @song.artist      

        if @song.save
            redirect_to @song
        else
            flash[:alert] = @song.errors.full_messages.join(". ")
            redirect_to new_song_path
        end
    end

    def edit
        current_song
    end

    def update
        current_song
        @song.update(song_params)
        redirect_to @song
    end

    def destroy

    end




    private

        def current_song
            @song = Song.find_by(id: params[:id])
        end

        def song_params
            params.require(:song).permit(:name)
        end
end
