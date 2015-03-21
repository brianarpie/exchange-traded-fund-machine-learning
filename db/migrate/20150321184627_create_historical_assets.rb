class CreateHistoricalAssets < ActiveRecord::Migration
  def change
    create_table :historical_assets do |t|
      t.integer :value
      t.string :asset_date
      t.belongs_to :etf_holding, index: true 
      
      t.timestamps
    end
  end
end
