class SessionsController < ApplicationController
    #before_action :redirect_if_logged_in, only: [:new]
    

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
        session.clear
        redirect_to new_user_path, notice: "Logged out"
    end

end

private

end
