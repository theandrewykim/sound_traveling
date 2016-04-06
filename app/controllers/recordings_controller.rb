class RecordingsController < ApplicationController

  skip_before_action :authenticate_user!,  only: [:index, :show]

  autocomplete :tag, :name, class_name: 'ActsAsTaggableOn::Tag'
  autocomplete :recording, :title, full: true

  def index
    @q = Recording.ransack(title_or_description_or_city_or_country_or_tags_name_cont: params[:recording_title])
    @recordings = @q.result(distinct: true).includes({ taggings: :tag }, :user)
    render 'welcome/index'
  end

  def autocomplete_recording_title
    @recordings = (Recording.by_title(params[:term]) +
                   Recording.by_city(params[:term]) +
                   Recording.by_tag(params[:term])).uniq

    render json: @recordings, root: false, each_serializer: AutocompleteSerializer
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
    if @recording.save
      redirect_to recording_path(@recording)
    else
      render :new
    end
  end

  def show
    @recording = Recording.find(params[:id])
    @playlistrecording = Playlistrecording.new
    @comment = @recording.comments.new
  end

  def delete
  end

  def like
    @recording = Recording.find(params[:id])
    @recording.liked_by current_user
    render "_like.html.erb", layout: false
  end

  def unlike
    @recording = Recording.find(params[:id])
    @recording.unliked_by current_user
    render "_like.html.erb", layout: false
  end

private
  def recording_params
    params[:recording][:tag_list] = params[:recording][:tag_list].join(',')
    params.require(:recording).permit(:title, :sound, :channels, :description, :latitude, :longitude, :tag_list).merge(user: current_user)
  end

end
