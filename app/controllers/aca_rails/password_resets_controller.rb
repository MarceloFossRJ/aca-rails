require_dependency "aca_rails/application_controller"

module AcaRails
  class PasswordResetsController < ApplicationController
    before_action :use_forgotten_pwd, only: [:new, :create, :edit, :update]

    def new

    end

    def create
      user = User.find_by_email(params[:email])
      if user
        user.send_password_reset
        redirect_to login_path, :notice => "Email sent with password reset instructions."
      else
        redirect_to login_path, :alert => "Email not registered. Password reset email not sent."
      end

    end

    def edit
      begin
        @user = User.find_by_password_reset_token!(params[:id])
      rescue
        redirect_to login_path, alert: "Password reset has expired, or wrong url."
      end

    end

    def update
      @user = User.find_by_password_reset_token!(params[:id])
      #@user.updating_password = true
      if @user.password_reset_sent_at < 2.hours.ago
        redirect_to new_password_reset_path, :alert => "Password reset has expired."
      elsif @user.update_attributes(user_params)
        redirect_to login_url, :notice => "Password has been reset."
      else
        render :edit
      end
    end

    private
    def user_params
      params.require(:user).permit(:password, :password_confirmation)
    end


  end
end
