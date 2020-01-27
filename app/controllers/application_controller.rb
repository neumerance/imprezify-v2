class ApplicationController < ActionController::Base
  before_action :authenticate_user!
  after_action :clear_xhr_flash

  def clear_xhr_flash
    flash.discard if request.xhr?
  end
end
