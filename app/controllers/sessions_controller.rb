class SessionsController < ApplicationController
    before_action :redirect_if_logged_in, only: [:new]
    

    def login

    end

    def logout
        session[:user_id] = nil
        redirect_to new_user_path, notice: "Logged out"
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

    

    def omniauth
        user = User.find_or_create_by(uid: request.env['omniauth.auth'][:provider], provider: request.env['onmiauth.auth'][:uid]) do |u|
            u.username = request.env['omniauth.auth'][:info][:first_name]
            u.email = request.env['omniauth.auth'][:info][:email]
            u.password = SecureRandom.hex(15)
        end
        if user.valid?
            session[:user_id] = user.id
            redirect_to root_path
        else
            redirect_to login_path
        end
    end

    
#protected
    
#    def auth
#        request.env['omniauth.auth']["info"]
#    end
end

private

end
