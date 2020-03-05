class LandingPagesController < ApplicationController
  before_action :set_home_navigation
  before_action :set_homepage_tags, only: :home
  before_action :no_index_tags, only: [:thankyou, :contact_us, :review]
  skip_before_action :authenticate_user!

  before_action :set_feedback, only: [:review, :contact_us, :feedback]

  layout 'landing'

  def home
    @resource = User.new
    @resource_name = 'user'
    @manifest ||= ResumeTemplatingEngine::Manifest.new.get
    @resume = Resume.new
    @reviews = Review::Get.all
  end

  def review
    @page_meta_tags[:title] = 'Tell us your experience with us.'
  end

  def contact_us
    @page_meta_tags[:title] = 'You concern is our priority'
  end

  def contribute; end

  def write; end

  def privacy; end

  def thankyou
    @page_meta_tags[:title] = 'Thank you for using Imprezify'
  end

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
