class Season < ActiveRecord::Base
  has_many :memberships, validate: true
  has_many :members, through: :memberships
  accepts_nested_attributes_for :memberships

  validates :name, presence: true, uniqueness: true
  validates :beginning_date, presence: true, uniqueness: true
  validates :ending_date, presence: true, uniqueness: true

  validate :validate_sane_dates

  def create_unfilled_memberships
    Month.ensure_12_months

    Month.all.each do |month|
      actual_membership = self.memberships.find_by(month: month)
      if actual_membership.nil?
        Membership.create! season: self, month: month
      end
    end
  end

  def ordered_memberships
    create_unfilled_memberships

    Month::NAMES.map do |month_name|
      month = Month.find_by(name: month_name)
      memberships.find_by(month_id: month.id)
    end
  end

  private

  def validate_sane_dates
    if beginning_date.present? && ending_date.present?
      unless beginning_date < ending_date
        errors.add(:ending_date, "must come after beginning date")
      end
    end
  end
end
