# frozen_string_literal: true

class User < ApplicationRecord
  has_secure_password
  has_many :player
  has_many :reports 
  has_many :puzzles
  validates :name, presence: true, length: { minimum: 3, maximum: 100 }, format: { with: /\A[^0-9`!@#$%\^&*+_=]+\z/ }
  validates :email, presence: true, length: { minimum: 10, maximum: 255 },uniqueness: true

  validates :phone_no, presence: true, length: { minimum: 10, maximum: 10 }
  validates :password, presence: true, length: { minimum: 7, maximum: 255 }
end
