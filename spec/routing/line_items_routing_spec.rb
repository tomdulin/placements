require "rails_helper"

RSpec.describe LineItemsController, type: :routing do
  describe "routing" do
    it "routes to #update via PATCH" do
      expect(patch: "/invoices/1/line_items/1").to route_to("line_items#update", invoice_id: "1", id: "1")
    end
  end
end
