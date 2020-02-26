class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable,
         :confirmable
  has_many :resumes

  enum support_type: [:free, :maintainer, :launcher]

  def devise_mailer
    ImprezifyDeviseMailer
  end

  def webmaster?
    ENV['WEBMASTER'] == email
  end
end
