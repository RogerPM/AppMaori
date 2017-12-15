class AddNewColumnToSaleDetailes < ActiveRecord::Migration
  def change
    add_column :sale_details, :number, :integer
  end
end
