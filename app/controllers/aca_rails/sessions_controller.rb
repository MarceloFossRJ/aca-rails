require_dependency "aca_rails/application_controller"

module AcaRails
  class SessionsController < ApplicationController

    def new
      session[:uid] = nil
      session[:lgtm] = nil
    end

    def create
      if (params[:login] != nil)



        user = User.find_by_email(params[:login][:email])
        if (user && user.aca_authenticate(params[:login][:password], request.remote_ip))

#        if params[:remember_me]
#          cookies.permanent[:auth_token] = user.auth_token
#        else
#          cookies[:auth_token] = user.auth_token
#        end
          session[:uid] = user.id
          session[:lgtm] = Time.now
          session[:cip] = request.remote_ip

          redirect_to root_url, :notice => "You are now logged in!"
        else

          if user && (user.is_locked? || !user.is_active?)
            flash[:error] = "Account is blocked, contact system admin."
            redirect_to locked_path
          else
            flash[:error] = "Invalid email/login or password"

            redirect_to :action => 'new'
          end
        end

      else
        redirect_to root_url, :alert => "Please contact your system administrator. Error: Login parameters"
      end
    end

    def destroy
      kill_session

      redirect_to login_path, :notice => "You have logged out!"
    end
  end
end
