class AddLatitudeToProperties < ActiveRecord::Migration[5.0]
  def change
    add_column :properties, :latitude, :float
  end
end
