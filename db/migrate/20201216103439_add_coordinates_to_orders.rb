class AddCoordinatesToOrders < ActiveRecord::Migration[6.0]
  def change
    add_column :orders, :order_lat, :float
    add_column :orders, :order_lon, :float
  end
end
