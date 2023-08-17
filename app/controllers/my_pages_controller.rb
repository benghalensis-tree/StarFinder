class MyPagesController < ApplicationController
  before_action :set_user
  before_action :authenticate_user!, only: [:edit, :update]
  before_action :correct_user, only: [:edit, :update]
  
  def show
    @posts = @user.posts.page(params[:page]).per(40)
  end

  def edit
  end
  
  def update
    if @user.update(user_params)
      redirect_to my_page_path(@user)
    else
      render :edit
    end
  end

  private

  def set_user
    @user = User.find(params[:id])
  end

  def user_params
    params.require(:user).permit(:name, :content, :image, :image_cache)
  end

  def correct_user
    unless current_user.id == @user.id
      flash[:alert] = '権限がありません'
      redirect_to posts_path
    end
  end
end
