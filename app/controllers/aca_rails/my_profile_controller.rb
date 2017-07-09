require_dependency "aca_rails/application_controller"

module AcaRails
  class MyProfileController < ApplicationController
    def edit
      @user = current_user
    end

    def update
      @user = User.find(params[:id])
      if @user.update(user_params)
        redirect_to root_url, notice: 'Your profile was successfully updated.'
      else
        render :edit
      end
    end

    private
    # Use callbacks to share common setup or constraints between actions.
    def set_user
      @user = User.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def user_params
      params.require(:user).permit(:name, :login, :email)
    end

  end
end
