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
  validates :description, presence: true
   include PgSearch::Model
  pg_search_scope :car_search,
    against: [ :make, :model, :description ],
     using: {
      tsearch: { prefix: true }
    }
end

