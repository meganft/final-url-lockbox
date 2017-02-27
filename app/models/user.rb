class User < ApplicationRecord
  has_secure_password

  validates :password, presence: true
  validates :email, presence: true
  validates :email, uniqueness: true

  has_many :links
  
end
