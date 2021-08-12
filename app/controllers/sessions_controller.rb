class SessionsController < ApplicationController
    before_action :redirect_if_logged_in, only: [:new]
    

    def login

    end

    def create
        user = User.find_by_username(params[:username])
        if user && user.authenticate(params[:password])
            session[:user_id] = user.id
            redirect_to user
        else
            flash[:errors] = ["Invalid Username or Password!"]
            redirect_to login_path
    end

    def logout
        session[:user_id] = nil
        redirect_to new_user_path, notice: "Logged out"
    end

    def omniauth
        user = User.find_or_create_by(uid: request.env['omniauth.auth'][:uid], provider: request.env['onmiauth.auth'][:provider]) do |u|
            u.username =
            u.email =
            u.password = SecureRandom.hex(15)
        user = Guest.o_auth_find_info(user_info)
        user_session_or_redirect(user)
    end

    
#protected
    
#    def auth
#        request.env['omniauth.auth']["info"]
#    end
end

private

end
