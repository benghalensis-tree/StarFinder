class FavoritesController < ApplicationController

  def create
    favorite = current_user.favorites.create(post_id: params[:post_id])
    @post = Post.find(params[:post_id])
    @post.update_column(:favorite_count, @post.favorites.count)
    if params[:page] == 'posts/index'
      redirect_to posts_path, notice: "お気に入り登録しました"
    elsif params[:page] == 'favorites/show'
      redirect_to favorite_path(current_user), notice: "お気に入り登録しました"
    elsif params[:page] == 'my_pages/show'
      redirect_to my_page_path(current_user), notice: "お気に入り登録しました"
    else
      redirect_to post_path(params[:post_id]), notice: "お気に入り登録しました"
    end 
  end
  
  def destroy
    favorite = current_user.favorites.find_by(id: params[:id]).destroy
    @post = Post.find(params[:post_id])
    @post.update_column(:favorite_count, @post.favorites.count)
    if params[:page] == 'posts/index'
      redirect_to posts_path, notice: "お気に入りを解除しました"
    elsif params[:page] == 'favorites/show'
      redirect_to favorite_path(current_user), notice: "お気に入りを解除しました"
    elsif params[:page] == 'my_pages/show'
      redirect_to my_page_path(current_user), notice: "お気に入りを解除しました"
    else
      redirect_to post_path(params[:post_id]), notice: "お気に入りを解除しました"
    end
  end

  def show
    @user = User.find(params[:id])
    @posts = @user.favorite_posts.page(params[:page]).per(40)
  end

end
