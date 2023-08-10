class MyPagesController < ApplicationController
  before_action :authenticate_user!, only: [:edit, :update]
  before_action :correct_user, only: [:edit, :update]
  
  def show
    @user = User.find(params[:id])
    @posts = @user.posts
  end

  def edit
    @user = User.find(current_user.id)
  end
  
  def update
    @user = User.find(current_user.id)
    if @user.update(user_params)
      redirect_to my_page_path(@user)
    else
      render :edit
    end
  end

  private
  def user_params
    params.require(:user).permit(:name, :content, :image, :image_cache)
  end

  def correct_user
    unless current_user == @user
      flash[:alert] = '権限がありません'
      redirect_to posts_path
    end
  end
end
