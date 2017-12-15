class AddNewColumnToSales < ActiveRecord::Migration
  def change
    add_column :sales, :number, :integer
  end
end
