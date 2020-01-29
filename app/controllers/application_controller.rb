class ApplicationController < ActionController::Base
  before_action :authenticate_user!
  after_action :clear_xhr_flash

  layout Proc.new { |controller| controller.request.xhr? ? false : 'application' }

  def clear_xhr_flash
    flash.discard if request.xhr?
  end
end
