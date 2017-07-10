module AcaRails
  class ApplicationController < ActionController::Base
    protect_from_forgery with: :exception

    if AcaRails.use_paper_trail
      before_action :set_paper_trail_whodunnit
    end

    def login_required
      if session[:uid]
        return true
      end
      flash[:warning]='Please login to continue'
      session[:return_to] = request.url
      redirect_to new_session_path
      return false
    end

    def admin_required
      login_required
      if current_user.is_admin
        return true
      else
        return unauthorized
        #return false
      end
    end

    def user_can_signup
      if AcaRails.user_can_signup
        return true
      else
        return method_not_allowed
      end
    end

    def user_can_inactivate
      if AcaRails.user_can_inactivate_account
        return true
      else
        return method_not_allowed
      end
    end

    def user_can_delete
      if AcaRails.user_can_delete_account
        return true
      else
        return method_not_allowed
      end
    end

    def user_can_be_deleted
      if AcaRails.user_can_have_account_deleted
        return true
      else
        return method_not_allowed
      end
    end

    def kill_session
      session[:uid] = nil
      session[:lgtm] = nil
      session[:cip] = nil

      cookies.delete(:auth_token)
    end

    private

    def current_user
      if session[:uid]
        @current_user ||= User.find(session[:uid])
      else
        @current_user = nil
      end

      #@current_user ||= User.find_by_auth_token( cookies[:auth_token]) if cookies[:auth_token
    end

    helper_method :current_user

    protected

    def unauthorized
      render status: 401, template: "/aca_rails/errors/unauthorized.html.erb"
      false
    end

    def forbidden
      render status: 403, template: "/aca_rails/errors/forbidden.html.erb"
      false
    end

    def not_found
      render status: 404, template: "/aca_rails/errors/not_found.html.erb"
      false
      end

    def method_not_allowed
      render status: 405, template: "/aca_rails/errors/method_not_allowed.html.erb"
      false
    end

  end
end
