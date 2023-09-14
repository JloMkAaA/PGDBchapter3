class ApplicationController < ActionController::Base
    helper_method :current_user, :logged_in?
    protect_from_forgery with: :exception  
    include SessionsHelper

    def logged_in_user      
        unless logged_in?    
          store_location    
          flash[:danger] = "Please log in."        
          redirect_to login_url      
        end    
    end
end
