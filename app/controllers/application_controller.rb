class ApplicationController < ActionController::Base
  before_action :configure_permitted_parameters, if: :devise_controller?
  before_action :set_search

  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:name, :image, :content])
    devise_parameter_sanitizer.permit(:account_update, keys: [:name, :image, :content])
  end

  private 
  def after_sign_in_path_for(resource)
    map_posts_path
  end

  def after_sign_out_path_for(resource)
    map_posts_path 
  end

  def set_search
    @q = Post.ransack(params[:q])
    @q.sorts
    @posts = @q.result
    @posts = @posts.page(params[:page]).per(20)
  end

end
