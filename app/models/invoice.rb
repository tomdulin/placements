class Invoice < ApplicationRecord
  has_paper_trail
  include PgSearch::Model

  has_one :campaign #, counter_cache: :count_of_line_items
  has_many :line_items, through: :campaign

  before_create :generate_number

  pg_search_scope :search, against: [:number], using: { tsearch: { prefix: true } }

  def grand_total
    self.campaign.billable_amount
  end

  private

  def generate_number
    self.number = DateTime.now.to_i + (Invoice.last&.id || 0)
  end
end
