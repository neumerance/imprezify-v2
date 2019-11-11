class ResumeController < ApplicationController
  before_action :set_resume

  def index
    @resumes = current_user.resumes
  end

  def edit; end

  private

  def set_resume
    @resume = current_user.resumes.find(params[:id])
  end
end
