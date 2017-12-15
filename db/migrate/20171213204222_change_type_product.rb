class ChangeTypeProduct < ActiveRecord::Migration
  def up
    change_table :products do |t|
      t.change :name, :string
    end
  end

  def down
    change_table :products do |t|
      t.change :name, :integer
    end
  end
end
