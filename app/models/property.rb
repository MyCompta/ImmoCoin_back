class Property < ApplicationRecord
  belongs_to :user
  has_many_attached :images

  validates :title, presence: true
  validates :price, presence: true, numericality: { only_integer: true }
  validates :description, presence: true
  validates :location, presence: true
end
