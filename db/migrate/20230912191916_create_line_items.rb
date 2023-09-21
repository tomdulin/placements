class CreateLineItems < ActiveRecord::Migration[7.0]
  def change
    create_table :line_items do |t|
      t.belongs_to :campaign, foreign_key: true, nil: false 
      t.string :name, nil: false
      t.decimal :booked_amount, nil: false, default: 0
      t.decimal :actual_amount, nil: false, default: 0
      t.decimal :adjustments, nil: false, default: 0

      t.timestamps
    end
  end
end
