class FavoritesController < ApplicationController

  def create
    favorite = current_user.favorites.create(post_id: params[:post_id])
    redirect_to post_path(params[:post_id]), notice: "お気に入り登録しました"
  end
  
  def destroy
    favorite = current_user.favorites.find_by(id: params[:id]).destroy
    redirect_to post_path(params[:id]), notice: "お気に入りを解除しました"
  end

  def show
    @user = User.find(params[:id])
    @posts = @user.favorite_posts
  end

end
