class User < ApplicationRecord
  validates :name, presence: true, length: {maximum: 15}
  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  validates :email, presence: true, uniqueness: true, format: { with: VALID_EMAIL_REGEX }
  VALID_PASSWORD_REGEX = /\A[a-zA-Z0-9]+\z/
  validates :password, presence: true, length: {in: 8..32}, format: { with: VALID_PASSWORD_REGEX }
  
  has_secure_password
  
  has_many :favorites
  has_many :favorite_topics, through: :favorites, source: 'topic'
end