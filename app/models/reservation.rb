class Reservation < ApplicationRecord
  validates :name, presence: true
  validate :start_date_check
  def start_date_check
    if self.start_date.hour < 9
      errors.add(:start_date, "営業時間外です。")
    elsif self.start_date.hour > 18
      errors.add(:start_date, "営業時間外です。")
    end
  end

end
