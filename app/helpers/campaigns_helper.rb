module CampaignsHelper
  def link_to_invoice_viewable_for(campaign)
    return '-' if campaign.selectable?

    link_to campaign.invoice.number,
      invoice_line_items_path(campaign.invoice), data: { turbo_frame: "_top" } 
  end

  def link_to_create_invoice(campaign)
    return "" unless campaign.selectable?
    link_to "",  new_invoice_path(campaign_id: campaign),
      title: "Create an Invoice with this campaign",
      class: "fa fa-plus-square fs-3", 
      data: { turbo_frame: "_top" } 
  end
end
