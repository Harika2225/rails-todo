class ApplicationController < ActionController::Base
    skip_before_action :verify_authenticity_token
    
    protect_from_forgery with: :exception
    before_action :authenticate_user!
    
    layout :layout_by_controller

    protected

    def layout_by_controller
        devise_controller? ? 'devise' : 'application'
    end
end
