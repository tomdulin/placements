class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  PASSWORD_LENGTH_ALLOWED = 6..128

  validates :email, presence: true, uniqueness: true, format: { with: URI::MailTo::EMAIL_REGEXP }
  validates_presence_of :name
  validates :password, presence: true, confirmation: true, if: :password_required?
  validates :password, length: PASSWORD_LENGTH_ALLOWED, allow_blank: true


  before_validation :sanitize_fields

  private

  def sanitize_fields
   self.email = email&.downcase&.strip
   self.name = name&.strip
  end
end
