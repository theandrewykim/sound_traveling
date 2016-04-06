class TagsController < ApplicationController
  skip_before_action :authenticate_user!,  only: [:show]

  def show
    @tag = params[:id]
    @recordings = Recording.tagged_with(@tag)
  end

end
