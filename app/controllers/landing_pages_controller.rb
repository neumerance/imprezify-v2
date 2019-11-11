class LandingPagesController < ApplicationController
  skip_before_action :authenticate_user!

  def home
    render layout: 'homepage'
  end
end
