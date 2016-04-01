class WelcomeController < ApplicationController
  def index
    @recordings = Recording.all
  end
end
