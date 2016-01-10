class Member < ActiveRecord::Base
  has_many :memberships
  has_many :seasons, through: :memberships

  validates :name, presence: true, uniqueness: true
  validates :email, presence: true, uniqueness: true, email: true
  validates :address, presence: true, uniqueness: true
end
