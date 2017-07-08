require_dependency "aca_rails/application_controller"

module AcaRails
  class SessionsController < ApplicationController
    def new
      session[:uid] = nil
    end

    def create
      if (params[:login] != nil)

        user = User.find_by_email(params[:login][:email])
        if (user && user.authenticate(params[:login][:password]) )
#        if params[:remember_me]
#          cookies.permanent[:auth_token] = user.auth_token
#        else
#          cookies[:auth_token] = user.auth_token
#        end

          session[:uid] = user.id
          redirect_to root_url, :notice => "You are now logged in!"
        else
          flash[:error] = "Invalid email/login or password"
          redirect_to :action => 'new'
        end

      else
        redirect_to root_url, :alert => "Please contact your system administrator. Error: Login parameters"
      end
    end

    def destroy
      session[:uid] = nil
      cookies.delete(:auth_token)
      redirect_to login_path, :notice => "You have logged out!"
    end
  end
end
