class Season < ActiveRecord::Base

  validates :name, presence: true
  validates :beginning_date, presence: true
  validates :ending_date, presence: true
end
