class SkillsController < EntitiesController
  MODEL = Skill

  private

  def allowed_params
    params.require(:skills).map(&:permit!)
  end
end
