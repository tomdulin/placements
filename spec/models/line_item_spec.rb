# frozen_string_literal: true

require 'rails_helper'

RSpec.describe LineItem do
  describe 'associations' do
    it { is_expected.to belong_to(:campaign) }
  end

  describe 'validations' do
    it { is_expected.to validate_presence_of(:name) }
  end

  describe 'db fields' do
    it { is_expected.to have_db_column(:name).of_type(:string) }
    it { is_expected.to have_db_column(:booked_amount).of_type(:decimal) }
    it { is_expected.to have_db_column(:actual_amount).of_type(:decimal) }
    it { is_expected.to have_db_column(:adjustments).of_type(:decimal) }
  end
end
