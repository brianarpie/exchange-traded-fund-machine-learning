class RemoveUnusedEtfColumns < ActiveRecord::Migration
  def change
    change_table :etfs do |t|
      t.remove :total_assets, :start_date
    end
  end
end
