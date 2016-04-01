class RecordingsController < ApplicationController
  def new
    @recording = Recording.new
  end

  def create
    @recording = Recording.new(recording_params)
    if  @recording.save
      redirect_to root_path
    else
      binding.pry
    end
  end

  def show
  end

private
  def recording_params
    params.require(:recording).permit(:title, :longitude, :sound_file, :description, :latitude, :longitude)
  end
end