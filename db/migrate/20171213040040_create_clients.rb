class CreateClients < ActiveRecord::Migration
  def change
    create_table :clients do |t|
      t.string :name
      t.string :last_name
      t.string :identification_card
      t.string :gender
      t.string :phone
      t.string :email
      t.date :birthday
      t.text :address
      t.string :country
      t.string :province
      t.string :city

      t.timestamps null: false
    end
  end
end
