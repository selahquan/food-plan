class ApplicationController < ActionController::Base
    
    helper_method :current_user, :logged_in?
    
    def current_user
        @current_user ||= User.find_by(id: session[:user_id]) if session[:user_id]
    end

    def set_current_user
        if session[:user_id]
            @current_user = User.find_by(id: session[:user_id])
        end
    end

    def logged_in?
        !!current_user
    end

end
