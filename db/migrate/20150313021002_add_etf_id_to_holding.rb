class AddEtfIdToHolding < ActiveRecord::Migration
  def change
    add_column :holdings, :etf_id, :integer
  end
end
