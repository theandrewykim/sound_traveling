class RecordingsController < ApplicationController
  def index
  end


  def edit
  end

  def update
  end

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
    @recording = Recording.find(params[:id])
  end

  def delete
  end

private
  def recording_params
    params.require(:recording).permit(:title,:sound, :description, :latitude, :longitude)
  end

end
