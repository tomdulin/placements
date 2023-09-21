require "rails_helper"

RSpec.describe InvoicesController, type: :routing do
  
  describe "routing" do
    it "routes to #index" do
      expect(get: "/invoices").to route_to("invoices#index")
    end

    it "routes to #show" do
      expect(get: "/invoices/1").to route_to("invoices#show", id: "1")
    end

  end
end
