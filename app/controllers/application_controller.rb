class ApplicationController < ActionController::Base
	rescue_from CanCan::AccessDenied do |exception|
    redirect_to main_app.root_url
  end
  protect_from_forgery with: :exception

  def meta_defaults
    seo = Seo.first
    if seo.present?
      @meta_title = seo.meta_title
      @meta_keywords = seo.meta_description
      @meta_description = seo.meta_keyword
    else
      @meta_title = "Welcome to Gifttaking.com"
      @meta_keywords = "The gift taking web application is a comprehensive online gifting platform geared towards the gift givers."
      @meta_description = "The gift taking web application is a comprehensive online gifting platform geared towards the gift givers."
    end
    
  end

end
