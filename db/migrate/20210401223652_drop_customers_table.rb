class DropCustomersTable < ActiveRecord::Migration[5.2]
  def change
  	drop_table :customers_tables
  end
end
