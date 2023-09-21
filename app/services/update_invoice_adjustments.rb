class UpdateInvoiceAdjustments
  class << self
    include Service

    def call(campaign)
      campaign.update(adjustments: campaign.line_items.sum(:adjustments))
    end
  end
end