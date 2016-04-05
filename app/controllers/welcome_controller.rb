class WelcomeController < ApplicationController
  skip_before_action :authenticate_user!


  def index
    @q = Recording.ransack(params[:q])
    @recordings = @q.result(distinct: true)
  end
end
