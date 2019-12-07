class WorkExperiencesController < EntitiesController
  MODEL = WorkExperience

  private

  def allowed_params
    params.require(:work_experiences).map(&:permit!)
  end
end
