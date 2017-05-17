class UsersController < ApplicationController
  before_action :set_user, only: [:show, :edit, :update, :following, :followers]
  before_action :authenticate_user!, except: :show

  def show
    @notes = @user.notes.where(is_draft: false).order('created_at DESC')
  end

  def edit
  end

  def update
    @user.update(profile_params)
    redirect_to user_path
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

  def profile_params
    params.require(:user).permit(:header_image, :image, :nickname, :description)
  end
end
