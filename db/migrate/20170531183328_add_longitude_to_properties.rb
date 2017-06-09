class AddLongitudeToProperties < ActiveRecord::Migration[5.0]
  def change
    add_column :properties, :longitude, :float
  end
end
