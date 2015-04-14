class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :first_name
      t.string :last_name
      t.boolean :is_admin
      t.string :email

      t.timestamps
    end
  end
end
