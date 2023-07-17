class CommentsController < ApplicationController
  def create
    post = Post.find(params[:post_id])
    comment = post.comments.build(comment_params)
    comment.user_id = current_user.id
    comment.save
  end
  private
  def comment_params
    params.require(:comment).permit(:content, :image)
  end
end
