class User < ApplicationRecord
  has_many :rides, dependent: :destroy
  has_many :reactions, dependent: :destroy
  
  # The has_secure_password method in your User model already takes care of checking whether password 
  # and password_confirmation match. When you assign a value to password_confirmation, Rails automatically 
  # validates that it matches the password.
  has_secure_password

  validates :name, :email, presence: :true
  validates :email, uniqueness: { case_sensitive: false }, format: { with: URI::MailTo::EMAIL_REGEXP }
  validates :password, length: { in: 3..55, too_long: "can't be longer than %{count} characters" }
  validates :password, :password_confirmation, confirmation: true

  mount_uploader :avatar, AvatarUploader
end
