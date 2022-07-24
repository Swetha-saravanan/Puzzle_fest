class Puzzle < ApplicationRecord
  validates :question , uniqueness: true
end
