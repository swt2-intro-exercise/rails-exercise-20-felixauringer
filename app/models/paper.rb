class Paper < ApplicationRecord
  validates :title, :year, presence: true
  validates :year, numericality: { only_integer: true }
end
