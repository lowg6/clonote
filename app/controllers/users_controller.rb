class UsersController < ApplicationController
  before_action :set_user, only: [:show, :edit, :following, :followers]

  def show
  end

  def edit
  end

  def following
    @users = @user.followings
    render 'show_following'
  end

  def followers
    @users = @user.followers
    render 'show_follower'
  end

  private

  def set_user
    @user = User.find_by(noteid: params[:noteid])
  end
end
