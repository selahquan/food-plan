class SessionsController < ApplicationController
    
    def logout
        session.clear
        redirect_to new_user_path, notice: "Logged out"
    end

end
