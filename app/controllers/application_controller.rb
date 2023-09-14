class ApplicationController < ActionController::Base
    helper_method :current_user, :logged_in?
    protect_from_forgery with: :exception  
    include SessionsHelper
end
