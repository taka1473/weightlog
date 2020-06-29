class ApplicationController < ActionController::Base
    include SessionsHelper
    
    
    private
    
    def correct_user
        @user = current_user
        unless @user == User.find_by(id: params[:id])
            redirect_to @user
        end
    end
    
    def require_user_logged_in
        unless logged_in?
            redirect_to login_url
        end
    end
end
