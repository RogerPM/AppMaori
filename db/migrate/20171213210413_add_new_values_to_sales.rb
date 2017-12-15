class AddNewValuesToSales < ActiveRecord::Migration
  def change
    add_column :sales, :state, :integer
  end
end
