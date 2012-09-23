class User < ActiveRecord::Base
  attr_accessible :account, :cash, :email, :name, :password, :password_confirmation
  has_secure_password
  validates :name, presence: true, length: { maximum: 50 }
  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  validates :email, presence: true, format: { with: VALID_EMAIL_REGEX }, uniqueness: true
  validates :account, uniqueness: { case_sensitive: false } , :numericality => { :only_integer => true }
  validates :password, presence:true, length: {minimum: 6}
  validates :password_confirmation, presence:true
end
