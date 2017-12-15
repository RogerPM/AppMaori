class CreateProviders < ActiveRecord::Migration
  def change
    create_table :providers do |t|
      t.string :name
      t.string :ruc
      t.string :phone
      t.text :address
      t.string :email
      t.string :state

      t.timestamps null: false
    end
  end
end
