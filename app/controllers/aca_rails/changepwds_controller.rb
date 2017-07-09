require_dependency "aca_rails/application_controller"

module AcaRails
  class ChangepwdsController < ApplicationController
    def edit
      @user = current_user
    end

    def update
      @user = User.find(params[:id])
      if @user && @user.authenticate(params[:old_password])
        @user.updating_password = true
        respond_to do |format|
          if @user.update_attributes(params[:user].permit(:password, :password_confirmation))
            format.html { redirect_to root_url, notice: 'User was successfully updated.' }
            format.json { head :no_content }
          else
            format.html { render action: "edit" }
            format.json { render json: @user.errors, status: :unprocessable_entity }
          end
        end
      else
        respond_to do |format|
          flash[:warning] = "Wrong password"
          format.html { render action: "edit", message: 'Wrong password' }
        end
      end
    end

  end
end
