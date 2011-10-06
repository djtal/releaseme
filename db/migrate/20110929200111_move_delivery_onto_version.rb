class MoveDeliveryOntoVersion < ActiveRecord::Migration
  def up
    rename_column :deliveries, :project_id, :version_id
    rename_column :deliveries, :environment_id, :application_id
  end

  def down
     rename_column :deliveries, :version_id, :project_id
     rename_column :deliveries, :application_id, :environment_id
  end
end