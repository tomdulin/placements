class LineItem < ApplicationRecord
  include Billable
  include PgSearch::Model
  
  belongs_to :campaign
  has_paper_trail on: [:update], only: [:adjustments]
  pg_search_scope :search, against: [:name, :actual_amount], using: { tsearch: { prefix: true } }

  validates :name, presence: true
end
