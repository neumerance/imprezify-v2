class LandingPagesController < ApplicationController
  before_action :set_home_navigation
  before_action :set_homepage_tags, only: :home
  skip_before_action :authenticate_user!

  before_action :set_feedback, only: [:review, :contact_us, :feedback]

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
    if @feedback.valid?
      ApplicationMailer.send_feedback(@feedback).deliver
      flash[:notice] = params[:notice]
      current_user.update(sent_feedback: true)
      redirect_to thankyou_path
    else
      flash[:danger] = 'Unable to submit your feedback. Please check all fields.'
      redirect_to params[:referrer_url]
    end
  end

  def thank_you; end

  private

  def set_feedback
    @feedback = Feedback.new
    @feedback.assign_attributes(feedback_params) if params[:feedback].present?
  end

  def feedback_params
    params.require(:feedback).permit(:subject, :email, :message, :rating)
  end
end
