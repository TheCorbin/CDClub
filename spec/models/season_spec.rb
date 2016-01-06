require 'rails_helper'

RSpec.describe Season, type: :model do
  context 'validation' do
    let(:subject) { create :season }

    it { is_expected.to validate_presence_of(:name) }
    it { is_expected.to validate_presence_of(:beginning_date) }
    it { is_expected.to validate_presence_of(:ending_date) }

    it { is_expected.to validate_uniqueness_of(:name) }
    it { is_expected.to validate_uniqueness_of(:beginning_date) }
    it { is_expected.to validate_uniqueness_of(:ending_date) }

    describe 'validate_sane_dates' do
      context 'ending_date after beginning_date' do
        let(:subject) { build :season, beginning_date: Date.yesterday, ending_date: Date.today }

        it { is_expected.to be_valid }
      end

      context 'ending_date same as beginning_date' do
        let(:subject) { build :season, beginning_date: Date.today, ending_date: Date.today }
        it { is_expected.not_to be_valid }
      end

      context 'ending_date before beginning_date' do
        let(:subject) { build :season, beginning_date: Date.today, ending_date: Date.yesterday }
        it { is_expected.not_to be_valid }
      end

    end
  end
end
