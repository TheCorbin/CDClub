class Month < ActiveRecord::Base
  validates :name, presence: true, uniqueness: true, inclusion: { in: Date::MONTHNAMES.compact }
  validates :order, presence: true, uniqueness: true, numericality: { less_than: 12, greater_than: -1 }

  def self.ensure_12_months
    if Month.count < 12
      12.times do |i|
        Month.find_or_create_by order: i, name: Date::MONTHNAMES.compact[i]
      end
    end
  end
end
