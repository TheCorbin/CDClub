require 'rails_helper'

RSpec.describe Season, type: :model do
  describe 'factory' do
    let!(:first_season) { create :season }
    let!(:second_season) { build :season }
    it 'creates multiple valid seasons' do
      expect(second_season).to be_valid
    end
  end

  context 'validation' do
    let(:subject) { create :season }

    it { is_expected.to validate_presence_of(:name) }
    it { is_expected.to validate_presence_of(:beginning_date) }
    it { is_expected.to validate_presence_of(:ending_date) }

    it { is_expected.to validate_uniqueness_of(:name) }
    it { is_expected.to validate_uniqueness_of(:beginning_date) }
    it { is_expected.to validate_uniqueness_of(:ending_date) }

    describe 'validate_sane_dates' do
      let(:subject) { build :season, beginning_date: beginning_date, ending_date: ending_date }
      context 'ending_date after beginning_date' do
        let(:beginning_date) { Time.zone.yesterday }
        let(:ending_date) { Time.zone.today }

        it { is_expected.to be_valid }
      end

      context 'ending_date same as beginning_date' do
        let(:beginning_date) { Time.zone.today }
        let(:ending_date) { Time.zone.today }

        it { is_expected.not_to be_valid }
      end

      context 'ending_date before beginning_date' do
        let(:beginning_date) { Time.zone.today }
        let(:ending_date) { Time.zone.yesterday }

        it { is_expected.not_to be_valid }
      end

    end
  end
end
