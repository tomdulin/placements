require 'rails_helper'

RSpec.describe Campaign, type: :model do
  describe 'associations' do
    it { is_expected.to have_many(:line_items) }
  end

  describe 'validations' do
    it { is_expected.to validate_presence_of(:name) }
  end

  describe 'db fields' do
    it { is_expected.to have_db_column(:name).of_type(:string) }
    it { is_expected.to have_db_column(:invoice_id).of_type(:integer) }
    it { is_expected.to have_db_column(:actual_amount).of_type(:decimal) }
    it { is_expected.to have_db_column(:adjustments).of_type(:decimal) }

    it { is_expected.to have_db_index(:name) }
  end

  describe 'actual_adjusted' do
    

    context 'should identify if it can be selected' do
      campaign = FactoryBot.create(:campaign)
      it { expect(campaign.selectable?).to eq(false) }
    end
  end
end
