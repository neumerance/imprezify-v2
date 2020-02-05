class LandingPagesController < ApplicationController
  skip_before_action :authenticate_user!

  layout 'landing'

  def home
    @resource = User.new
    @resource_name = 'user'
  end
end
