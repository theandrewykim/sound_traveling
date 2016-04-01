class WelcomeController < ApplicationController
  def index
    @recording = Recording.all
  end
end
