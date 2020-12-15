class AddUsersToOrders < ActiveRecord::Migration[6.0]
  def change
    add_reference :orders, :manager, index: true
    add_foreign_key :orders, :users, column: :manager_id
    add_reference :orders, :fixer, index: true
    add_foreign_key :orders, :users, column: :fixer_id
    add_reference :orders, :customer, index: true
    add_foreign_key :orders, :users, column: :customer_id
  end
end
