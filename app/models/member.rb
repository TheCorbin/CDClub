class Member < ActiveRecord::Base
  validates :name, presence: true, uniqueness: true
  validates :email, presence: true, uniqueness: true, email: true
  validates :address, presence: true, uniqueness: true
end
