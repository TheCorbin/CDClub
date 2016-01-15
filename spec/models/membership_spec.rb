require 'rails_helper'

RSpec.describe Membership, type: :model do
  it { is_expected.to belong_to :member }
  it { is_expected.to belong_to :season }

  describe 'factory' do
    let!(:first_membership) { create :membership}
    let!(:second_membership) { build :membership }
    it 'creates multiple valid memberships' do
      expect(second_membership).to be_valid
    end
  end

  context 'validation' do
    let(:subject) { create :membership }

    describe 'member' do
      # it { is_expected.not_to validate_presence_of(:member_id) }
      it { is_expected.to validate_uniqueness_of(:member_id).scoped_to(:season_id) }
    end

    describe 'season' do
      it { is_expected.to validate_presence_of(:season_id) }
    end

    describe 'month' do
      it { is_expected.to validate_uniqueness_of(:month).scoped_to(:season_id) }
      it { is_expected.to validate_inclusion_of(:month).
                   in_array(Date::MONTHNAMES.compact)}
    end
  end
end
