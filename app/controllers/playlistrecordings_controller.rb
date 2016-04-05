class PlaylistrecordingsController < ApplicationController
  def new
    @q = Recording.ransack(params[:q])
    @recordings = @q.result(distinct: true)
    @playlist = Playlist.find(params[:playlist_id])
    @playlistrecording = Playlistrecording.new
  end

  def create
    if !!params[:recording_id]
      @playlist = Playlist.find(params[:playlist_id])
      @playlistrecording = Playlistrecording.new(playlist_id: @playlist.id, recording_id:params[:recording_id] )
      if @playlistrecording.save
        redirect_to :back
      else
        # error handing
      end
    else
      @playlist = Playlist.find(params[:playlist_id])
      @playlistrecording = Playlistrecording.new(playlist_id: @playlist.id, recording_id: params[:playlistrecording][:recording])
      if @playlistrecording.save
        redirect_to new_playlist_playlistrecording_path(@playlist)
      else
        #Add error validations
      end
    end
  end

  def destroy
    @playlistrecording = Playlistrecording.find(params[:id])
    @playlist = Playlist.find(params[:playlist_id])
    if @playlistrecording.destroy
      redirect_to new_playlist_playlistrecording_path(@playlist)
    else
    end
  end
end
