class CreatePercentages < ActiveRecord::Migration
  def change
    create_table :historical_percentages do |t|
      t.decimal :value, precision: 18, scale: 4
      t.date :percentage_date
      t.belongs_to :etf_holding, index: true

      t.timestamps
    end
  end
end
