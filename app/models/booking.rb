class Booking < ApplicationRecord
  belongs_to :user
  belongs_to :car
  has_one :review, dependent: :destroy

  validates :start_date, :end_date, presence: true
  validate :end_date_after_start_date

  def total_price
    @days = (end_date - start_date).to_i
    @days * car.price
  end

  private

  def end_date_after_start_date
    return if end_date.blank? || start_date.blank?

    if end_date < start_date
      errors.add(:end_date, "must be after the start date")
    elsif start_date < Date.today
      errors.add(:start_date, "can't book in the past")
    end
  end
end
