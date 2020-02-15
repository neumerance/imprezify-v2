class BasicInfoController < ApplicationController
  before_action :set_product

  layout false

  def update
    @resume.basic_info.update(allowed_params)
    @resume.basic_info.photo.attach(allowed_params[:photo])
  end

  private

  def set_product
    @resume = Resume.where(id: params[:resume_id], user: current_user).first
  end

  def allowed_params
    params.require(:basic_info).permit!
  end
end
