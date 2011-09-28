class CreateApplications < ActiveRecord::Migration
  def change
    create_table :applications do |t|
      t.belongs_to :channel
      t.belongs_to :environment
      t.integer :position
      t.timestamps
    end
  end
end
