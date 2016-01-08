require 'rails_helper'

RSpec.describe Member, type: :model do
  describe 'factory' do
    let! (:first_member) { create :member }
    let! (:second_member) { build :member }
    it 'creates multiple valid members' do
      expect(second_member).to be_valid
    end
  end

  context 'validation' do
    let(:subject) { create :member }

    it { is_expected.to validate_presence_of(:name) }
    it { is_expected.not_to validate_presence_of(:month) }
    it { is_expected.to validate_presence_of(:email) }
    it { is_expected.to validate_presence_of(:address) }

    it { is_expected.to validate_uniqueness_of(:name) }
    it { is_expected.to validate_uniqueness_of(:email) }
  end
end
