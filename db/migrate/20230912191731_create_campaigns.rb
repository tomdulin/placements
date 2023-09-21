class CreateCampaigns < ActiveRecord::Migration[7.0]
  def change
    create_table :campaigns do |t|
      t.belongs_to :invoice, foreign_key: true
      t.string :name, index: true, null: false
      t.decimal :actual_amount, null: false, default: 0
      t.decimal :adjustments, null: false, default: 0
      
      t.timestamps
    end
  end
end
