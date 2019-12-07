class EducationsController < EntitiesController
  MODEL = Education

  private

  def allowed_params
    params.require(:educations).map(&:permit!)
  end
end
