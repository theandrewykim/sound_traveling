class RecordingsController < ApplicationController
  def index
  end

  def new
  end

  def create
  end

  def edit
  end

  def update
  end

  def show
    @recording = Recording.find(params[:id])
  end

  def delete
  end
end
