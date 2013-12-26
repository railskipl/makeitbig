class ApplicationController < ActionController::Base
	rescue_from CanCan::AccessDenied do |exception|
    redirect_to main_app.root_url
  end
  protect_from_forgery with: :exception

  def meta_defaults
     @meta_title = "Welcome to FastShoppy.com"
      @meta_keywords = "FastShoppy"
     @meta_description = "FastShoppy"
  end

end
