class EntitiesController < ApplicationController
  MODEL = Entity

  before_action :set_resume
  before_action :set_resource, only: [:destroy, :new]

  layout false

  def new; end

  def create
    allowed_params.each do |entity_params|
      entity = self.class.model.find(entity_params[:id])
      entity.update(entity_params.except(:id, :logo))
      entity.logo.attach(entity_params[:logo]) if entity_params[:logo].present?
    end
  end

  def destroy
    self.class.model.find(params[:id]).destroy if params[:id].present?
  end

  private

  def self.model
    self::MODEL
  end

  def set_resume
    @resume = Resume.where(id: params[:resume_id], user: current_user).first
  end

  def set_resource
    @resource = if params[:id].present?
                  self.class.model.find(params[:id])
                else
                  self.class.model.create(resume: @resume)
                end
  end

  def allowed_params
    params.require(:entities).map(&:permit!)
  end
end
