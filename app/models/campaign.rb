class Campaign < ApplicationRecord
  include Billable
  include PgSearch::Model

  has_many :line_items
  belongs_to :invoice, optional: :true
  validates_presence_of :name
  pg_search_scope :search, against: [:name, :actual_amount], using: { tsearch: { prefix: true } }

  def selectable?
    self.invoice_id.nil?
  end
end
