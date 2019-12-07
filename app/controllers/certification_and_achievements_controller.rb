class CertificationAndAchievementsController < EntitiesController
  MODEL = CertificationAndAchievement

  private

  def allowed_params
    params.require(:certification_and_achievements).map(&:permit!)
  end
end
