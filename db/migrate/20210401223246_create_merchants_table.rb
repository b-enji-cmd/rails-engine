class CreateMerchantsTable < ActiveRecord::Migration[5.2]
  def change
    create_table :merchants_tables do |t|
      t.string :name
    end
  end
end
