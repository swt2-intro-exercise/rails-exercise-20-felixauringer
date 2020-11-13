class Paper < ApplicationRecord
  has_and_belongs_to_many :authors

  validates :title, :venue, :year, presence: true
  validates :year, numericality: { only_integer: true }

  def author_list
    authors.map { |author| author.name }.join(', ')
  end
end
