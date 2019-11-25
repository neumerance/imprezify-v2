class ResumeController < ApplicationController
  before_action :set_resume, only: [:edit, :update, :destroy, :add_more_entity, :preview]

  def index
    @resumes = current_user.resumes
  end

  def edit
    if params[:entity_name].present?
      entity = @resume.try(params[:entity_name].to_sym)&.build
      # byebug
      entity.save(validate: false)
    end
  end

  def update
    @resume.update(allowed_params)
  end

  def preview
    render layout: false
  end

  private

  def allowed_params
    params.require(:resume).permit!
  end

  def set_resume
    @resume = Resume.where(id:  params[:id], user: current_user).first
  end
end
