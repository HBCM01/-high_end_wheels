class Car < ApplicationRecord
  belongs_to :user
  has_many_attached :photos
  has_many :bookings, dependent: :destroy
  has_many :reviews, through: :bookings, dependent: :destroy

  validates :make, presence: true
  validates :model, presence: true
  validates :price, presence: true
  validates :address, presence: true
  validates :user_id, presence: true
end
