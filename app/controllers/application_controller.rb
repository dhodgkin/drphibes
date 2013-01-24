class ApplicationController < ActionController::Base
  protect_from_forgery
  include FrontendHelpers::Html5Helper

  def after_sign_in_path_for(resource)
    stored_location_for(resource) || root_path
  end
  
  def after_sign_out_path_for(resource)
    stored_location_for(resource) || root_path
  end    
end