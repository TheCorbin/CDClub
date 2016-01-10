class Season < ActiveRecord::Base
  has_many :memberships
  has_many :members, through: :memberships

  validates :name, presence: true, uniqueness: true
  validates :beginning_date, presence: true, uniqueness: true
  validates :ending_date, presence: true, uniqueness: true

  validate :validate_sane_dates

  private

  def validate_sane_dates
    if beginning_date.present? && ending_date.present?
      unless beginning_date < ending_date
        errors.add(:ending_date, "must come after beginning date")
      end
    end
  end
end
