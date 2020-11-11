class Author < ApplicationRecord
  validates :first_name, :last_name, presence: true

  def name
    "#{first_name} #{last_name}"
  end

  def has_homepage?
    homepage.present?
  end
end
