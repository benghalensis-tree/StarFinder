class PostsController < ApplicationController
  include PostsHelper
  before_action :set_post, only: %i[ show edit update destroy ]
  before_action :authenticate_user!, only: [:new, :create, :edit, :update, :destory]

  def index
    @bests = Post.order(view_count: :desc).limit(5)
    @q = Post.ransack(params[:q])
    @q.sorts = ['view_count desc', 'favorite_count desc'] if @q.sorts.empty? 
    @posts = @q.result
    gon.posts = @posts.map do |post|
      {
        title: post.title,
        view_count: post.view_count,
        content: post.content,
        latitude: post.latitude,
        longitude: post.longitude,
        image_url: post.image.url,
        post_url: post_url(post)
      }
    end
    @light_pollutions = LightPollution.all
    gon.light_pollutions = @light_pollutions.map do |light_pollution|
      {
        latitude: light_pollution.latitude,
        longitude: light_pollution.longitude,
        limiting_mag: light_pollution.limiting_mag,
      }
    end
   
    if params[:date].present?
      @weather_forecasts = WeatherForecast.where(date: params[:date])
      gon.weather_forecasts = @weather_forecasts.map do |weather_forecast|
        {
          icon: weather_forecast.icon,
          latitude: weather_forecast.city.latitude,
          longitude: weather_forecast.city.longitude,
        }
      end
      @date = params[:date].to_date
      @moon_time = moon_time(@date)
      @day = "#{@date.month}/#{@date.day}"
    else
      @date = Date.today
      @moon_time = moon_time(@date)
      @day = "#{@date.month}/#{@date.day}"
    end
  end

  def show
    if user_signed_in?
      @favorite = current_user.favorites.find_by(post_id: params[:id])
      unless ViewCount.where(created_at: Time.zone.now.all_day).find_by(user_id: current_user.id, post_id: @post.id)
        current_user.view_counts.create(post_id: @post.id)
        @post.update_column(:view_count, @post.view_counts.count)
      end
    end
    @comment = @post.comments.build
    @comments = @post.comments
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
  end

  def new
    @post = Post.new
    @post.build_rating
  end

  def edit
  end

  def create
    @post = Post.new(post_params)
    @post.user_id = current_user.id
    if @post.save
      redirect_to post_url(@post), notice: "Post was successfully created."
    else
      render :new, status: :unprocessable_entity
    end
  end

  def update
    if @post.update(post_params)
      redirect_to post_url(@post), notice: "Post was successfully updated."
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    @post.destroy
    redirect_to posts_url, notice: "Post was successfully destroyed."
  end

  private
    def set_post
      @post = Post.find(params[:id])
    end

    def post_params
      params.require(:post).permit(:title, :content, :access_date, :address, :latitude, :longitude, :image, :image_cache, :view_count,rating_attributes: [:id, :sky_light,:sky_clear,:sky_extent, :accessiblity, :convenient])
    end
end
