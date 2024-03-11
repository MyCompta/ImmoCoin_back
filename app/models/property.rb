class Property < ApplicationRecord
  belongs_to :user

  validates :title, presence: true
  validates :price, presence: true, numericality: { only_integer: true }
  validates :description, presence: true
end
