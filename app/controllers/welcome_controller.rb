class WelcomeController < ApplicationController
  def index
    @q = Recording.ransack(params[:q])
    @recordings = @q.result(distinct: true)
  end
end