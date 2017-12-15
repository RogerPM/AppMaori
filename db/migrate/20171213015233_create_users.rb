class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :name
      t.string :last_name
      t.string :identification_card
      t.text :address
      t.date :birthday
      t.string :phone
      t.date :contract_date
      t.date :contract_date_end
      t.string :position
      t.string :state

      t.timestamps null: false
    end
  end
end
