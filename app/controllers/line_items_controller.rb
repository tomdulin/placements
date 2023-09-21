class LineItemsController < SecureController
  layout "member"
  before_action :set_line_item, only: %i[ update ]
  include Invoiceable
  SORTABLE_COLUMS = %w{ name booked_amount actual_amount adjustments }
  DEFAULT_SORT = "name"
  include Filterable
  
  def index
    @line_items = @invoice.line_items
    @line_items = @line_items.search(params[:query]) if params[:query].present?
    @pagy, @line_items = filter(@line_items, SORTABLE_COLUMS, DEFAULT_SORT)
  end

  def update
    @line_item.update(line_item_params)
    UpdateInvoiceAdjustments.call(@line_item.campaign)

    respond_to do |format|
      format.html { redirect_to invoice_line_items_path(
        @line_item.campaign.invoice,
        **filterable_params
        ) }
    end
  end

  private
  def set_line_item
    @line_item = LineItem.find(params[:id])
  end

  def line_item_params
    params.require(:line_item).permit(:adjustments)
  end
end
