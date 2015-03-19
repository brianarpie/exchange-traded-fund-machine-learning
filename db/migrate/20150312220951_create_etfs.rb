class CreateEtfs < ActiveRecord::Migration
  def change
    create_table :etfs do |t|
      t.string :name
      t.string :ticker_symbol
      t.date :start_date
      t.integer :total_assets

      t.timestamps
    end
  end
end
