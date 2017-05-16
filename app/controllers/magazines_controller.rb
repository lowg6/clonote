class MagazinesController < ApplicationController
  before_action :set_magazine, only: [:show, :edit, :update, :destroy]

  def index
    @magazines = current_user.magazines.order('created_at DESC')
  end

  def show
    unless @magazine.is_public
      unless view_context.current_user?(@magazine.user)
        redirect_to root_path
      end
    end

    @user = @magazine.user
  end

  def new
    @magazine = current_user.magazines.new
  end

  def edit
    redirect_to root_path unless view_context.current_user?(@magazine.user)
  end

  def create
    @magazine = current_user.magazines.create(magazine_params)
    redirect_to @magazine
  end

  def update
    @magazine.update(magazine_params)
    redirect_to @magazine
  end

  def destroy
    @magazine.destroy
    redirect_to magazines_url
  end

  private
   
  def set_magazine
    @magazine = Magazine.find(params[:id])
  end

  def magazine_params
    params.require(:magazine).permit(:title, :description, :header_image, :price, :is_public).merge(user_id: current_user.id)
  end
end
