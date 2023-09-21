# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Invoice do
  describe 'associations' do
    it { is_expected.to have_many(:line_items) }
    it { is_expected.to have_one(:campaign) }
  end

  describe 'db fields' do
    it { is_expected.to have_db_column(:number).of_type(:string) }

    it { is_expected.to have_db_index(:number) }
  end

  describe 'actual_adjusted' do
    let(:campaign) { FactoryBot.create(:campaign) }

    context 'should return correct value' do
      it { expect(campaign.invoice.grand_total).to eq(campaign.actual_amount + campaign.adjustments) }
    end

    context 'should generate number' do
      it { expect(campaign.invoice.number).to_not eq(nil) }
    end
  end
end
