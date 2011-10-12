class AddEnvValidationAttr < ActiveRecord::Migration
  def up
    add_column :environments, :ask_deliver, :boolean, :default => false
  end

  def down
    remove_column :environments, :ask_deliver,
  end
end