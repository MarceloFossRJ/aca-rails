module AcaRails
  class ApplicationController < ActionController::Base
    protect_from_forgery with: :exception

    before_action :set_paper_trail_whodunnit

    def login_required
      if session[:uid]
        return true
      end
      flash[:warning]='Please login to continue'
      session[:return_to] = request.url
      redirect_to new_session_path
      return false
    end

    private

    def current_user
      @current_user ||= User.find(session[:uid]) if session[:uid]
      #@current_user ||= User.find_by_auth_token( cookies[:auth_token]) if cookies[:auth_token]
    end

    helper_method :current_user


  end
end
