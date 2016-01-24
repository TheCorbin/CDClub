class Membership < ActiveRecord::Base
  belongs_to :member
  belongs_to :season
  belongs_to :month

  validates :member_id, uniqueness: { scope: :season_id, allow_nil: true }
  validates :season_id, presence: true
  validates :month_id, presence: true, uniqueness: { scope: :season_id }
end
