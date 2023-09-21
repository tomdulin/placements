# frozen_string_literal: true

require 'rails_helper'

RSpec.describe User do

  describe 'db fields' do
    it { is_expected.to have_db_column(:email).of_type(:string) }
    it { is_expected.to have_db_column(:name).of_type(:string) }
    it { is_expected.to have_db_column(:remember_created_at).of_type(:datetime) }

    it { is_expected.to have_db_index(:email) }
    it { is_expected.to have_db_index(:reset_password_token) }
  end

  describe 'before validation' do
    describe '#sanitize_fields' do
      let(:email) { 'Email.@test.Com' }
      let(:name) { ' John Doe ' }
      let(:user) { User.new(email: email, name: name)}

      it 'makes email downcase, strip name', aggregate_failures: true do
        user.validate
        expect(user.email).to eq('email.@test.com')
        expect(user.name).to eq('John Doe')
      end
    end
  end
end
