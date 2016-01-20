class Month < ActiveRecord::Base
  validates :name, presence: true, uniqueness: true, inclusion: { in: Date::MONTHNAMES.compact }
  validates :order, presence: true, uniqueness: true, numericality: { less_than: 12, greater_than: -1 }
end
