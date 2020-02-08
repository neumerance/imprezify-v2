class LandingPagesController < ApplicationController
  before_action :set_home_navigation
  before_action :set_homepage_tags, only: :home
  skip_before_action :authenticate_user!

  layout 'landing'

  def home
    @resource = User.new
    @resource_name = 'user'
    @manifest ||= ResumeTemplatingEngine::Manifest.new.get
    @resume = Resume.new
  end

  def contacts; end

  def contribute; end

  def write; end

  def privacy; end
end
