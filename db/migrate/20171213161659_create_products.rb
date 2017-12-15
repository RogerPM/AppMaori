class CreateProducts < ActiveRecord::Migration
  def change
    create_table :products do |t|
      t.integer :name
      t.decimal :purchase_price
      t.decimal :sale_price
      t.integer :quantity
      t.integer :minimun_quantity
      t.decimal :gain
      t.references :provider, index: true, foreign_key: true
      t.string :type
      t.boolean :state

      t.timestamps null: false
    end
  end
end
