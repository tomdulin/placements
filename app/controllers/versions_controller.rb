class VersionsController < ApplicationController
  layout "member"
  include Invoiceable
  SORTABLE_COLUMS = %w{ created_at }
  DEFAULT_SORT = "created_at"
  include Filterable

  def index
    @versions = Version.where(item_type: 'LineItem', item_id: @invoice.line_items).or(Version.where(item_type: 'Invoice', item_id: @invoice.id))
    @versions = @versions.search(params[:query]) if params[:query].present?
    @pagy, @versions = filter(@versions, SORTABLE_COLUMS, DEFAULT_SORT)
  end
end
