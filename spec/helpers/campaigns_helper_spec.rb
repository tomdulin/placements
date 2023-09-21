require 'rails_helper'

# Specs in this file have access to a helper object that includes
# the CampaignsHelper. For example:
#
# describe CampaignsHelper do
#   describe "string concat" do
#     it "concats two strings with spaces" do
#       expect(helper.concat_strings("this","that")).to eq("this that")
#     end
#   end
# end
RSpec.describe CampaignsHelper, type: :helper do

  describe 'when campaign has an invoice' do
    context 'link_to_create_invoice' do
      it 'returns empty string' do
        campaign = FactoryBot.create(:campaign)
        expect(link_to_create_invoice(campaign)).to eql ""
      end
    end
    context 'link_to_invoice_viewable_for' do
      it 'returns an empty symbol' do
        campaign = FactoryBot.create(:campaign)
        expect(link_to_invoice_viewable_for(campaign)).to_not eql "-"
      end
    end
  end
end
