class CreateEnvironments < ActiveRecord::Migration
  def change
    create_table :environments do |t|
      t.string :name
      t.string :version
      t.boolean :active
      t.timestamps
    end
  end
end
