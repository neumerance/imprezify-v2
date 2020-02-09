class ApplicationController < ActionController::Base
  include LandingNavigationMenuHandler
  include PageMetaTagHandler

  before_action :authenticate_user!
  after_action :clear_xhr_flash

  layout :layout_by_resource

  def clear_xhr_flash
    flash.discard if request.xhr?
  end

  private

  def layout_by_resource
    return false if request.xhr?
    if devise_controller?
      "landing"
    else
      "application"
    end
  end

  def after_sign_in_path_for(resource)
    stored_location_for(resource) || resume_index_path
  end
end
