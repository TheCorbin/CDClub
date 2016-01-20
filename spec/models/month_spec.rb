require 'rails_helper'

RSpec.describe Month, type: :model do
  context "validation" do
    context 'name' do
      it { is_expected.to validate_presence_of(:name) }
      it { is_expected.to validate_uniqueness_of(:name) }

      it { is_expected.to validate_inclusion_of(:name).in_array([
            'January', 'February', 'March', 'April', 'May', 'June', 'July',
            'August', 'September', 'October', 'November', 'December'])}
    end

    context 'order' do
      it { is_expected.to validate_presence_of(:order) }
      it { is_expected.to validate_uniqueness_of(:order) }
      it { is_expected.to validate_numericality_of(:order).is_less_than(12).is_greater_than(-1) }
    end
  end
end
