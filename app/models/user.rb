class User < ApplicationRecord
  has_secure_password
  validates :email, :phone_no , presence: true, uniqueness: true
end
