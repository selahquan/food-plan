module ApplicationHelper
    def current_user
        @current_user ||= User.find_by(id: session[:user_id]) if session[:user_id]
    end

    def logged_in?
        !!current_user
    end

    def redirect_if_not_logged_in
        if !logged_in?
            redirect_to login_path
        end
    end

    def redirect_if_not_authorized_to_view(user)
        if !authorized_to_view?(user)
            flash[:message] = "You are not authorized to view that page"
            redirect_to user_path(current_user)
        end
    end
end
