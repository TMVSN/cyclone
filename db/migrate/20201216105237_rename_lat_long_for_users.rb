class RenameLatLongForUsers < ActiveRecord::Migration[6.0]
  def change
    rename_column :orders, :order_lat, :latitude
    rename_column :orders, :order_lon, :longitude
  end
end
