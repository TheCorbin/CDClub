require 'rails_helper'

RSpec.describe Season, type: :model do
  before do
    Month.ensure_12_months
  end

  it { is_expected.to have_many(:memberships) }
  it { is_expected.to have_many(:members).through(:memberships) }
  it { is_expected.to accept_nested_attributes_for(:memberships) }

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

  describe 'create_unfilled_memberships' do
    let(:season) { create :season }

    let(:returned_memberships) do
      season.create_unfilled_memberships
      season.memberships
    end

    let(:returned_months) { returned_memberships.map{|membership| membership.month.order} }

    let(:num_filled_memberships) do
      returned_memberships.select { |membership| membership.member.present? }.count
    end

    let(:num_unfilled_memberships) do
      returned_memberships.select { |membership| membership.member.nil? }.count
    end

    context 'with 12 existing memberships' do
      before do
        Month.all.order(:order).each do |month|
          create :membership, season: season, month: month
        end
      end

      it 'returns those existing memberships in order by month' do
        expect(returned_months).to eq((0..11).to_a)
        expect(num_filled_memberships).to eq(12)
        expect(num_unfilled_memberships).to eq(0)
      end
    end

    context 'with no existing memberships' do
      # no before block that creates membership records

      it 'returns 12 placeholder memberships in order by month' do
        expect(returned_months).to eq((0..11).to_a)
        expect(num_filled_memberships).to eq(0)
        expect(num_unfilled_memberships).to eq(12)
      end
    end

    context 'with some existing memberships' do
      before do
        ['March', 'June', 'September'].each do |month_name|
          month = Month.find_by name: month_name
          create :membership, season: season, month: month
        end
      end

      it 'returns a mixture of actual, and placeholder memberships, in order by month' do
        expect(returned_months.to_set).to eq((0..11).to_set)
        expect(num_filled_memberships).to eq(3)
        expect(num_unfilled_memberships).to eq(9)
      end
    end
  end
end
