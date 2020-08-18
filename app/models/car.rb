class Car < ApplicationRecord
  belongs_to :user
  has_many_attached :photos
  validates :make, presence: true
  validates :model, presence: true
  validates :price, presence: true
  validates :address, presence: true
  validates :user_id, presence: true
end
