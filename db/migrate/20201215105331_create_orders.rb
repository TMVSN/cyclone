class CreateOrders < ActiveRecord::Migration[6.0]
  def change
    create_table :orders do |t|
      t.string :address
      t.datetime :date
      t.boolean :fixed
      

      t.timestamps
    end
  end
end
