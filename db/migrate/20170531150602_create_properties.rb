class CreateProperties < ActiveRecord::Migration[5.0]
  def change
    create_table :properties do |t|
      t.integer :user_id
      t.string :address
      t.integer :zip_code
      t.string :state
      t.string :city
      t.float :acreage
      t.string :description
      t.float :price
      t.boolean :accommodations

      t.timestamps

    end
  end
end
