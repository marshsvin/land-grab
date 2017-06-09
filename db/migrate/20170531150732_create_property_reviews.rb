class CreatePropertyReviews < ActiveRecord::Migration[5.0]
  def change
    create_table :property_reviews do |t|
      t.string :content
      t.integer :property_id
      t.integer :user_id

      t.timestamps

    end
  end
end
