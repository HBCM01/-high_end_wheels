class Car < ApplicationRecord
  belongs_to :user
  validates :make, presence: true
  validates :model, presence: true
  validates :price, presence: true
  validates :addrrss, presence: true
  validates :user_id, presence: true
end
