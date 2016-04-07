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
        flash[:notice] = "That didn't work!"
      end
    else
      @playlist = Playlist.find(params[:playlist_id])
      @recording = Recording.find(params[:playlistrecording][:recording])
      @playlistrecording = Playlistrecording.new(playlist_id: @playlist.id, recording_id: @recording.id)
      if @playlistrecording.save
        render '_trackbutton.html.erb', layout: false
      else
        #Add error validations
      end
    end
  end

  def destroy
    @playlistrecording = Playlistrecording.find(params[:id])
    @playlist = Playlist.find(params[:playlist_id])
    @recording = Recording.find(params[:playlistrecording][:recording])
    if @playlistrecording.destroy
      render '_trackbutton.html.erb', layout: false
    else
    end
  end
end
