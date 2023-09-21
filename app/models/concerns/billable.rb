module Billable
  def billable_amount
   self.actual_amount + self.adjustments
  end
end