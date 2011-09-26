class AddProjcetCounterCache < ActiveRecord::Migration
  def up
    add_column :projects, :deliveries_count, :integer, :default => 0
  end

  def down
    remove_column :projects, :deliveries_count
  end
end