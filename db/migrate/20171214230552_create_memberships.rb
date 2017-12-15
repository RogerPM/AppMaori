class CreateMemberships < ActiveRecord::Migration
  def change
    create_table :memberships do |t|
      t.string :rate_name
      t.integer :sessions
      t.references :service, index: true, foreign_key: true
      t.integer :days_expire
      t.decimal :price
      t.decimal :discount
      t.string :type
      t.boolean :state

      t.timestamps null: false
    end
  end
end
