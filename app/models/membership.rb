class Membership < ActiveRecord::Base
  belongs_to :member
  belongs_to :season

  validates :member_id, uniqueness: { scope: :season_id, allow_nil: true }
  validates :season_id, presence: true
  validates :month, {uniqueness: { scope: :season_id }, inclusion: { in: Date::MONTHNAMES.compact}}
end
