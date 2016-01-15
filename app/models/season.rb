class Season < ActiveRecord::Base
  has_many :memberships
  has_many :members, through: :memberships
  accepts_nested_attributes_for :memberships

  validates :name, presence: true, uniqueness: true
  validates :beginning_date, presence: true, uniqueness: true
  validates :ending_date, presence: true, uniqueness: true

  validate :validate_sane_dates

  def create_unfilled_memberships
    Date::MONTHNAMES.compact.each do |month_name|
      actual_membership = self.memberships.find_by(month: month_name)
      if actual_membership.nil?
        Membership.create! season: self, month: month_name
      end
    end
  end

  def ordered_memberships
    Date::MONTHNAMES.compact.map do |month_name|
      memberships.find_by(month: month_name)
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
