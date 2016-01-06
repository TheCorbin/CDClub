class Season < ActiveRecord::Base
  validates :name, presence: true, uniqueness: true
  validates :beginning_date, presence: true, uniqueness: true
  validates :ending_date, presence: true, uniqueness: true

  validate :validate_sane_dates

  private

  def validate_sane_dates
    if beginning_date.present? && ending_date.present?
      if beginning_date == ending_date
        errors.add(:ending_date, "must come after beginning date")
      end

      if ending_date < beginning_date
        errors.add(:beginning_date, "must come before ending date")
      end
    end
  end
end
