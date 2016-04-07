class RelationshipsController < ApplicationController

  def create
    @user = current_user
    @followed_user = User.find_by(id: params[:user_id])
    @relationship = Relationship.new(follower_id: @user.id, followed_id: @followed_user.id)
    if @relationship.save
      # redirect_to user_path(@followed_user)
      render "/users/_user.html.erb", locals: {user: @followed_user}, layout: false
    else
      "Error"
    end
  end

  def destroy
    @unsubbed_user = User.find(params[:user_id])
    @user = current_user
    @follow = Relationship.where(follower_id: @unsubbed_user.id ,following_id:@user.id)
    @unsubbed_user.followers.delete(@user)
    # redirect_to user_path(@unsubbed_user)
    render "/users/_user.html.erb", locals: {user: @unsubbed_user}, layout:false
  end
end
