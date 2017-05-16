class MagazineRelationshipsController < ApplicationController
  def create
    @magazine = Magazine.find(params[:magazine_relationship][:magazine_id])
    current_user.magazine_follow!(@magazine)
    redirect_to @magazine
  end

  def destroy
    @magazine = MagazineRelationship.find(params[:id]).magazine
    current_user.magazine_unfollow!(@magazine)
    redirect_to @magazine
  end
end
