class CharacterReferencesController < EntitiesController
  MODEL = CharacterReference

  private

  def allowed_params
    params.require(:character_references).map(&:permit!)
  end
end
