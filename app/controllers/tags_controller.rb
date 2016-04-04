class TagsController < ApplicationController

  def show
    @tag = params[:id]
    @recordings = Recording.tagged_with(@tag)
  end

end
