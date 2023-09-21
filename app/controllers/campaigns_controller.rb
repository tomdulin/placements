class CampaignsController < SecureController
  layout "member"
  before_action :set_campaign, only: %i[ show destroy edit ]
  SORTABLE_COLUMS = %w{ name adjustments actual_amount }
  DEFAULT_SORT = "name"
  include Filterable



  # GET /campaigns or /campaigns.json
  def index
    @selectable = params[:selectable]&.to_i == 1
    @campaigns = @selectable ? Campaign.where(invoice_id: nil) : Campaign.all # only show unselected campaigns
    @campaigns = @campaigns.search(params[:query]) if params[:query].present?
    @pagy, @campaigns = filter(@campaigns, SORTABLE_COLUMS, DEFAULT_SORT)
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_campaign
      @campaign = Campaign.includes(:invoice, :line_items).find(params[:id])
    end
end
