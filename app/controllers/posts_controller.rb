class PostsController < ApplicationController
  before_action :set_post, only: %i[ show edit update destroy ]
  before_action :authenticate_user!, only: [:new, :create, :edit, :update, :destory]


  # GET /posts or /posts.json
  def index
    @q = Post.ransack(params[:q])
    @q.sorts = ['view_count desc', 'favorite_count desc'] if @q.sorts.empty? 
    @posts = @q.result
  end

  def map
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
    response = RestClient.get "https://api.open-meteo.com/v1/forecast?latitude=35.6785&longitude=139.6823&daily=weathercode&timezone=Asia%2FTokyo&forecast_days=14"
    @weather_data = JSON.parse(response.body)
  end

  # GET /posts/new
  def new
    @post = Post.new
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
      params.require(:post).permit(:title, :content, :access_date, :address, :latitude, :longitude, :image, :image_cache, :view_count)
    end
end
