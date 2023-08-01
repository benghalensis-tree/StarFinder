class PostsController < ApplicationController
  before_action :set_post, only: %i[ show edit update destroy ]
  before_action :authenticate_user!, only: [:new, :create, :edit, :update, :destory]


  # GET /posts or /posts.json
  def index
    @bests = Post.order(view_count: :desc).limit(5)
    @q = Post.ransack(params[:q])
    @q.sorts = ['view_count desc', 'favorite_count desc'] if @q.sorts.empty? 
    @posts = @q.result
  end

  def map
    @bests = Post.order(view_count: :desc).limit(5)
    @q = Post.ransack(params[:q])
    @posts = @q.result
    gon.posts = @posts.map do |post|
      {
        title: post.title,
        address: post.address,
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
  end

  # GET /posts/1 or /posts/1.json
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

  # GET /posts/new
  def new
    @post = Post.new
    @post.build_rating
  end

  # GET /posts/1/edit
  def edit
  end

  # POST /posts or /posts.json
  def create
    @post = Post.new(post_params)
    @post.user_id = current_user.id

    respond_to do |format|
      if @post.save
        format.html { redirect_to post_url(@post), notice: "Post was successfully created." }
        format.json { render :show, status: :created, location: @post }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @post.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /posts/1 or /posts/1.json
  def update
    respond_to do |format|
      if @post.update(post_params)
        format.html { redirect_to post_url(@post), notice: "Post was successfully updated." }
        format.json { render :show, status: :ok, location: @post }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @post.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /posts/1 or /posts/1.json
  def destroy
    @post.destroy

    respond_to do |format|
      format.html { redirect_to posts_url, notice: "Post was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_post
      @post = Post.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def post_params
      params.require(:post).permit(:title, :content, :access_date, :address, :latitude, :longitude, :image, :image_cache, :view_count,rating_attributes: [:id, :sky_light,:sky_clear,:sky_extent, :accessiblity, :convenient])
    end
end
