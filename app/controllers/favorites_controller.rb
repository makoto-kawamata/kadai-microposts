class FavoritesController < ApplicationController
  before_action :require_user_logged_in

  def create
    micropost = Micropost.find(params[:micropost_id])
    current_user.likes(micropost)
    flash[:success] = 'つぶやきをお気に入りに登録しました！'
    redirect_to current_user
  end

  def destroy
    micropost = Micropost.find(params[:micropost_id])
    current_user.unlikes(micropost)
    flash[:success] = 'お気に入りから解除しました！'
    redirect_to current_user
  end
end
