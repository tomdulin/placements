class Version < PaperTrail::Version
  include PgSearch::Model
  pg_search_scope :search, against: [:created_at, :object], using: { tsearch: { prefix: true } }

  serialize :object, Hash

  def invoice?
    return self.item_type === 'Invoice'
  end
end