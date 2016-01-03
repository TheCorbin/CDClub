require 'rails_helper'

RSpec.describe Season, type: :model do
  # validates presence of: name, beginning and ending_dates
  # validates uniqueness of name
  it { should validate_presence_of(:name) }
end
