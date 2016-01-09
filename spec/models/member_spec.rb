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

    describe 'name' do
      it { is_expected.to validate_presence_of(:name) }
      it { is_expected.to validate_uniqueness_of(:name) }
    end

    describe 'month' do
      it { is_expected.not_to validate_presence_of(:month) }
    end

    describe 'email' do
      let(:member) {build :member, email: email}
      it { is_expected.to validate_presence_of(:email) }
      it { is_expected.to validate_uniqueness_of(:email) }

      context 'when valid' do
        let(:email) { 'valid_email@example.com' }
        it "is valid" do
          expect(member).to be_valid
        end
      end

      context 'missing @ symbol' do
        let(:email) { 'no_at_sign_example.com' }
        it 'is invalid' do
          expect(member).not_to be_valid
        end
      end

      context 'without suffix' do
        let(:email) { 'no_suffix@example' }
        it 'is invalid' do
          expect(member).not_to be_valid
        end
      end

      context 'without prefix' do
        let(:email) { '@example.com' }
        it 'is invalid' do
          expect(member).not_to be_valid
        end
      end

      context 'illegal characters' do
        let(:email) { 'bad_;characters@example.com' }
        it 'is invalid' do
          expect(member).not_to be_valid
        end
      end
    end

    describe 'address' do
      it { is_expected.to validate_presence_of(:address) }
    end


  end
end
