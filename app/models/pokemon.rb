class Pokemon < ApplicationRecord
  has_one_attached :asset

  validates :name, presence: true, uniqueness: true
  validates :pokedex_number, presence: true, uniqueness: true

  def toggle_captured!
    update!(captured: !captured)
  end
end
