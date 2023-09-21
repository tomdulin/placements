module Filterable extend ActiveSupport::Concern
  included do
    def sort_direction
      %w{ asc desc }.include?(params[:direction]) ? params[:direction] : "asc"
    end

    def sort_column(columns, default_column)
      columns.include?(params[:sort]) ? params[:sort] : default_column
    end

    def filter(collection, columns, default_column)
      pagy collection.reorder(sort_column(columns, default_column) => sort_direction), items: params.fetch(:count, 10)
    end

    def filterable_params
      filter = {}
      FILTER_PARAMS.each do |p|
        filter[p] = params[p] if params[p].present?
      end
      filter
    end
  end
end