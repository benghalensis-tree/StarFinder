class CommentsController < ApplicationController
  def create
    @post = Post.find(params[:post_id])
    @comments = @post.comments
    @comment = @post.comments.build(comment_params)
    @comment.user_id = current_user.id
    if @comment.save
      redirect_to post_path(@post)
    else
      render 'posts/show'
    end
  end

  def destroy
    post = Post.find(params[:post_id])
    comment = post.comments.find(params[:id])
    if comment.destroy
      redirect_to post_path(post)
    else
      render 'posts/show'
    end
  end

  def show
    @user = User.find(params[:id])
    @comments = @user.comments
  end

  private
  def comment_params
    params.require(:comment).permit(:content, :image)
  end
end
