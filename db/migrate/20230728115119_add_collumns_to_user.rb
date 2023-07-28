class AddCollumnsToUser < ActiveRecord::Migration[7.0]
  def change
    add_column :users, :first_name, :string
    add_column :users, :last_name, :string
    add_column :users, :address, :text
    add_column :users, :zipcode, :integer
    add_column :users, :user_name, :text
    add_column :users, :customer, :string
    add_column :users, :manager, :string
    add_column :users, :rider, :string
  end
end
