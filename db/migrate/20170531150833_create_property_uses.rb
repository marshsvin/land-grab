class CreatePropertyUses < ActiveRecord::Migration[5.0]
  def change
    create_table :property_uses do |t|
      t.integer :activity_id
      t.integer :property_id

      t.timestamps

    end
  end
end
