class MoveDeliAttrToVersion < ActiveRecord::Migration
  def up
    add_column :versions, :require_label, :boolean
    add_column :versions, :description, :text
    remove_column :deliveries, :need_label
    remove_column :deliveries, :description
  end

  def down
    remove_column :versions, :require_label
    remove_column :versions, :description
    add_column :deliveries, :need_label, :boolean
    add_column :deliveries, :description, :text
  end
end