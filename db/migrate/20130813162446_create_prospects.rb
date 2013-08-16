class CreateProspects < ActiveRecord::Migration
  def change
    create_table :prospects do |t|
      t.integer :event_id
      t.string :email

      t.timestamps
    end
  end
end
