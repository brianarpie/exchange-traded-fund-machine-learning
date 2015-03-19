class CreateEtfHoldings < ActiveRecord::Migration
  def change
    create_table :etf_holdings do |t|
      t.belongs_to :etf, index: true
      t.belongs_to :holding, index: true
      t.timestamps
    end
  end
end
