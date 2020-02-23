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

  def review; end

  def contact_us; end

  def contribute; end

  def write; end

  def privacy; end

  def thankyou; end

  def feedback
    feedback = Feedback.new
    feedback.assign_attributes(feedback_params)
    ApplicationMailer.send_feedback(feedback_params).deliver
    flash[:notice] = feedback_params[:notice]
    redirect_to thankyou_path
  end

  def thank_you
  end

  private

  def feedback_params
    params.require(:feedback).permit(:subject, :email, :message, :rating, :notice)
  end
end
