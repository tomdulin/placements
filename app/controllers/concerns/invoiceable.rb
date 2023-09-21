module Invoiceable extend ActiveSupport::Concern
  included do
    before_action :set_invoice, only: %i[ show index]
  end

  def set_invoice
    invoice_id = params[:id] || params[:invoice_id]
    return unless invoice_id.present?
    @invoice = Invoice.includes(:campaign, :line_items).find(invoice_id)
  end
end