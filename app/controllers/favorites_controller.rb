class FavoritesController < ApplicationController

  def create
    favorite = current_user.favorites.create(post_id: params[:post_id])
    @post = Post.find(params[:post_id])
    @post.update_column(:favorite_count, @post.favorites.count)
    respond_to do |format|
      format.js
    end
  end
  
  def destroy
    favorite = current_user.favorites.find_by(id: params[:id]).destroy
    @post = Post.find(params[:post_id])
    @post.update_column(:favorite_count, @post.favorites.count)
    respond_to do |format|
      format.js
    end
  end

  def show
    @user = User.find(params[:id])
    @posts = @user.favorite_posts.page(params[:page]).per(40)
  end

end
