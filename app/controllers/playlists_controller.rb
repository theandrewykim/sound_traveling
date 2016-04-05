class PlaylistsController < ApplicationController
  def new
    @playlist = Playlist.new
  end

  def create
    @playlist = Playlist.new(playlist_params)
    if @playlist.save
      redirect_to new_playlist_playlistrecording_path(@playlist)
    else
      #error handling\
    end
  end



private
  def playlist_params
    params.require(:playlist).permit(:name, :description).merge(user: current_user)
  end

end

