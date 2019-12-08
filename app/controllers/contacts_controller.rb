class ContactsController < EntitiesController
  MODEL = Contact

  private

  def allowed_params
    params.require(:contacts).map(&:permit!)
  end
end
