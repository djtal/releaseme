class CreateVersions < ActiveRecord::Migration
  def change
    create_table :versions do |t|
      t.string :version
      t.belongs_to :channel
      t.belongs_to :project
      t.timestamps
    end
  end
end
