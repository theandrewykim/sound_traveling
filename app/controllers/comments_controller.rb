class CommentsController < ApplicationController
  def show
  end

  def new
    @recording = Recording.find(params[:recording_id])
    @comment = @recording.comments.new
  end

  def create
    @recording = Recording.find(params[:recording_id])
    @comment = @recording.comments.new(comment_params)
    if @comment.save
      flash[:success] = 'Comment posted.'
      redirect_to recording_path(@recording)
    else
      flash[:alert] = "Didn't Save"
      redirect_to recording_path(@recording)
    end

  end

  def edit
  end

  def update
  end

  def delete
  end

private
  def comment_params
    params.require(:comment).permit(:body).merge(user: current_user)
  end

end
