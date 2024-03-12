class Property < ApplicationRecord
  belongs_to :user

  validates :title, presence: true
  validates :price, presence: true
  validates :description, presence: true

  validates :furnished, :terrace, :garden, :caretaker, :lift, inclusion: { in: [true, false] }
  validates :surface, presence: true, numericality: { only_integer: true, greater_than: 0 }
  validates :room, presence: true, numericality: { only_integer: true, greater_than: 0 }
  validates :floor, presence: true, numericality: { only_integer: true, greater_than: -2 }
end
