# frozen_string_literal: true

class Assessment < ApplicationRecord
  has_one_attached :images
  validates :name, presence: true, length: { minimum: 3, maximum: 100 }, format: { with: /\A[^0-9`!@#$%\^&*+_=]+\z/ }
                  #  uniqueness: { case_senitive: false }
end
