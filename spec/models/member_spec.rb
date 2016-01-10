require 'rails_helper'

ILLEGAL_EMAIL_CHARACTERS = ['(', ')', '<', '>', ',', ';', ':', "\\", '/', "\"", '[', ']', '{', '}' ]

RSpec.describe Member, type: :model do
  it { is_expected.to have_many(:memberships) }
  it { is_expected.to have_many(:seasons).through(:memberships) }

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

    describe 'email' do
      let(:email) { 'valid_email@example.com' }
      let(:subject) {build :member, email: email}

      it { is_expected.to validate_presence_of(:email) }
      it { is_expected.to validate_uniqueness_of(:email) }

      context 'when valid' do
        it { is_expected.to be_valid }
      end

      context 'missing @ symbol' do
        let(:email) { 'no_at_sign_example.com' }
        it { is_expected.not_to be_valid }
      end

      context 'without suffix' do
        let(:email) { 'no_suffix@example' }
        it { is_expected.not_to be_valid }
      end

      context 'without prefix' do
        let(:email) { '@example.com' }
        it { is_expected.not_to be_valid }
      end

      ILLEGAL_EMAIL_CHARACTERS.each do |bad_char|
        context "illegal character: '#{bad_char}'" do
          let(:email) { "bad_#{bad_char}_characters@example.com" }

          it { is_expected.not_to be_valid }
        end
      end
    end

    describe 'address' do
      it { is_expected.to validate_presence_of(:address) }
    end

  end
end
