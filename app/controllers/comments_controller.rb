class CommentsController < ApplicationController
  def create
    @post = Post.find(params[:post_id])
    if user_signed_in?
      @favorite = current_user.favorites.find_by(post_id: @post.id)
      unless ViewCount.where(created_at: Time.zone.now.all_day).find_by(user_id: current_user.id, post_id: @post.id)
        current_user.view_counts.create(post_id: @post.id)
        @post.update_column(:view_count, @post.view_counts.count)
      end
    end
    latitude = @post.latitude
    longitude = @post.longitude
    response = RestClient.get "https://api.open-meteo.com/v1/forecast?latitude=#{latitude}&longitude=#{longitude}&daily=weathercode&timezone=Asia%2FTokyo&forecast_days=14"
    @weather_data = JSON.parse(response.body)
    if @post.rating.present?
      gon.rating_data = [
        @post.rating.sky_light,
        @post.rating.sky_clear,
        @post.rating.sky_extent,
        @post.rating.accessiblity,
        @post.rating.convenient,
      ]
    end
    lat_sec = @post.latitude * 3600
    lon_sec = @post.longitude * 3600
    @hotels = RakutenWebService::Travel::Hotel.search(latitude: lat_sec.round(2), longitude: lon_sec.round(2), searchRadius: 3)
    
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
