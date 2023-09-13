# frozen_string_literal: true

class Users::SessionsController < Devise::SessionsController
  # before_action :configure_sign_in_params, only: [:create]

  ##################################################################
  # ゲストログインについての記述
  # def new_guest
  #   user = User.guest
  #   sign_in user
  #   redirect_to maps_path, notice: 'ゲストユーザーとしてログインしました。'
  # end

  # def new_guest_admin
  #   user = User.guest_admin
  #   sign_in user
  #   redirect_to maps_path, notice: '管理者ユーザーとしてログインしました。'
  # end
  ##################################################################

  # GET /resource/sign_in
  # def new
  #   super
  # end

  # POST /resource/sign_in
  # def create
  #   super
  # end

  # DELETE /resource/sign_out
  # def destroy
  #   super
  # end

  # protected

  # If you have extra params to permit, append them to the sanitizer.
  # def configure_sign_in_params
  #   devise_parameter_sanitizer.permit(:sign_in, keys: [:attribute])
  # end
end
