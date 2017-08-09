require_dependency "aca_rails/application_controller"

module AcaRails
  class InactivateController < ApplicationController

    before_action :user_can_inactivate, only: [:edit, :update]
    before_action :user_can_delete, only: [:destroy]
    before_filter :login_required

    def edit
      @user = current_user
    end

    def update
      @user = User.find(params[:id])

      respond_to do |format|
        if @user.update_attributes(params[:user].permit(:is_active))
              kill_session
              format.html { redirect_to login_path , notice: 'Account successfully inactivated.' }
              format.json { head :no_content }
        else
              format.html { render action: "edit" }
              format.json { render json: @user.errors, status: :unprocessable_entity }
        end
      end
    end

    def destroy
      @user = current_user
      @user.destroy
      kill_session
      redirect_to login_path, notice: 'User was successfully destroyed.'
    end

  end
end
