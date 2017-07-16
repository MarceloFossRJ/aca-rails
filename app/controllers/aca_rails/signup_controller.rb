require_dependency "aca_rails/application_controller"

module AcaRails
  class SignupController < ApplicationController

    before_action :user_can_signup
    before_action :user_confirm_email, only: [:edit]

    def new
      @user = User.new
    end

    # POST /users
    def create
      params[:user][:is_admin] = false
      params[:user][:is_active] = true

      @user = User.new(user_params)

      if @user.save
        redirect_to login_path, notice: 'User was successfully created. Please login now!'
      else
        render :new
      end
    end

    def edit
      @user = User.find(params[:id])
      if @user
        @user.confirm_email
      end
    end

    private
    # Only allow a trusted parameter "white list" through.
    def user_params
      params.require(:user).permit(:name, :login, :email, :password, :password_confirmation, :is_admin, :is_active)
    end
  end
end
