class ImprezifyDeviseMailer < Devise::Mailer
  layout "mailer"

  before_action :set_confirmation_instructions_title, only: :confirmation_instructions

  private

  def set_confirmation_instructions_title
    @title = 'Thank you for joining Imprezify'
  end
end
