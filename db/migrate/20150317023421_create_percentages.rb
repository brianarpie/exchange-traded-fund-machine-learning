class CreatePercentages < ActiveRecord::Migration
  def change
    create_table :percentages do |t|
      t.decimal :value, precision: 18, scale: 4
      t.string :percentage_date
      t.belongs_to :etf_holding, index: true

      t.timestamps
    end
  end
end
