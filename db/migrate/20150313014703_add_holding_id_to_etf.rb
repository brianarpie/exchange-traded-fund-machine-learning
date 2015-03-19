class AddHoldingIdToEtf < ActiveRecord::Migration
  def change
    add_column :etfs, :holding_id, :integer
  end
end
