class ApplicationController < ActionController::Base
  before_action :authenticate_user!
  after_action :clear_xhr_flash

  layout Proc.new { |controller| controller.request.xhr? ? false : 'application' }
  layout :layout_by_resource

  def clear_xhr_flash
    flash.discard if request.xhr?
  end

  private

  def layout_by_resource
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
