class AddCreditcardToOrders < ActiveRecord::Migration
  def self.up
    add_column :orders, :creditcard, :integer
    add_column :orders, :month, :integer
    add_column :orders, :year, :integer
    add_column :orders, :verification_value, :integer
  end

  def self.down
    remove_column :orders, :verification_value
    remove_column :orders, :year
    remove_column :orders, :month
    remove_column :orders, :creditcard
  end
end
