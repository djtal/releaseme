class CreateDeliveries < ActiveRecord::Migration
  def change
    create_table :deliveries do |t|
      t.belongs_to :project
      t.belongs_to :environment
      t.string :state
      t.boolean :need_label
      t.text :description
      t.timestamps
    end
  end
end
