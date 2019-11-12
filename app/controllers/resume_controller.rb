class ResumeController < ApplicationController
  before_action :set_resume, only: [:edit, :update, :destroy]

  def index
    @resumes = current_user.resumes
  end

  def edit; end

  def update
    @resume.update_attributes(allowed_params)
  end

  private

  def allowed_params
    params.require(:resume).permit!
  end

  def set_resume
    @resume = current_user.resumes.find(params[:id])
  end
end
