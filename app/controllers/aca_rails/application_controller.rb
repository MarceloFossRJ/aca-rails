module AcaRails
  class ApplicationController < ActionController::Base
    protect_from_forgery with: :exception

    before_filter :update_activity_time
    if AcaRails.use_paper_trail
      before_action :set_paper_trail_whodunnit
    end

    def login_required

      if !session[:uid]
        kill_session
        session[:return_to] = request.url
        redirect_to login_path, alert: 'Please login to continue'
      else
        if AcaRails.expire_session_per_time && AcaRails.minutes_to_expire_session.minutes > 1
          session_expiry
        end
      end
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

    def use_forgotten_pwd
      if AcaRails.use_forgotten_password
        return true
      else
        return method_not_allowed
      end
    end

    def user_confirm_email
      if AcaRails.user_confirm_signup_by_email
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

    def session_expiry
      if (session[:expires_at].to_i - Time.now.to_i).to_i < 0
        kill_session
        redirect_to login_path, alert: 'Your session has timed out. Please log back in.'
      end
    end

    def update_activity_time
      begin
        if AcaRails.minutes_to_expire_session.minutes > 1 && AcaRails.expire_session_per_time
          if session[:expires_at_new]
            session[:expires_at] = session[:expires_at_new]
          else
            session[:expires_at] = (Time.now + AcaRails.minutes_to_expire_session.minutes).to_i
          end

          session[:expires_at_new] = (Time.now + AcaRails.minutes_to_expire_session.minutes).to_i
        end
      rescue
        flash[:error] = 'Session timout needs to be configured properly. Please contact system admin.'
      end
    end

    private

    def current_user
      if cookies[:auth_token]
        @current_user ||= User.find_by_auth_token( cookies[:auth_token])
      elsif session[:uid]
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
