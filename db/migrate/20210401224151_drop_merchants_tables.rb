class DropMerchantsTables < ActiveRecord::Migration[5.2]
  def change
  	drop_table :merchants_tables
  end
end
