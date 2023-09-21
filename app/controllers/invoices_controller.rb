class InvoicesController < SecureController
  layout "member"
  include Invoiceable
  SORTABLE_COLUMS = %w{ number }
  DEFAULT_SORT = "number"
  include Filterable

  # GET /invoices or /invoices.json
  def index
    @invoices = params[:query].present? ? Invoice.all.search(params[:query]) : Invoice.all
    @pagy, @invoices = filter(@invoices, SORTABLE_COLUMS, DEFAULT_SORT)
  end

  # GET /invoices/1 or /invoices/1.json
  def show
  end

  def new
    campaign = Campaign.find(params[:campaign_id])
    campaign.invoice = Invoice.create!
    campaign.save
    respond_to do |format|
      format.html { redirect_to invoice_line_items_path(campaign.invoice) }
    end
  end

  private
    def invoice_params
      params.permit(:campaign_id)
    end
end
