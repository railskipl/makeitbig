class ApplicationController < ActionController::Base
	rescue_from CanCan::AccessDenied do |exception|
    redirect_to main_app.root_url
  end
  protect_from_forgery with: :exception

  before_filter :meta_defaults

  def meta_defaults
      @meta_title = "Welcome to FastShoppy.com"
      @meta_keywords = "FastShoppy"
      @meta_description = "FastShoppy"
  end

# rescue_from ActionController::RoutingError, :with => :render_not_found

# def routing_error
#   raise ActionController::RoutingError.new(params[:path])
# end

# def render_not_found
#   render :template => "home/404"
# end

end
